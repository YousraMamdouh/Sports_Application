//
//  FavoritesViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 20/05/2023.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = FavoritesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
   setUPTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bindingViewModel()
        viewModel.getFavoriteTeamsFromDatabase()
       
    }

    func bindingViewModel()
    {
        viewModel.observable.bind {
            [weak self]
            result in
            guard let self = self ,  let isLoading = result
                    else
            {
                return
            }

            DispatchQueue.main.async {
                if isLoading
                {
                    self.tableView.reloadData()
                }
            }

        }
    }

func setUPTableView()
    {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    

}


extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getTeamsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.configureTeamCell(team: viewModel.getTeam(index: indexPath.row))
        return cell
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            
            let alertController = UIAlertController(title: "Confirmation", message:"Are you sure you want to delete this item?", preferredStyle: .alert)
            
       
            let confirmAction = UIAlertAction(title: "Yes", style: .default) { _ in
                self.viewModel.deleteTeamFromDatabase(index: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
          
            }
            let cancelationAction = UIAlertAction(title: "No", style: .default) { _ in
                return
            }
            
            alertController.addAction(confirmAction)
            alertController.addAction(cancelationAction)
                
            
            if let topController = UIApplication.shared.keyWindow?.rootViewController {
                topController.present(alertController, animated: true, completion: nil)
            }
          
           
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Teams"
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vC = self.storyboard?.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController
        vC.teamId = viewModel.getTeamId(index: indexPath.row)
        self.navigationController?.pushViewController(vC, animated: true)
    }
}
