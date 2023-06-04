//
//  FavoritesViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 20/05/2023.
//

import UIKit
import Reachability
import Lottie

class FavoritesViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var tableView: UITableView!
    let reachability = try! Reachability()
    let viewModel = FavoritesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
   setUPTableView()
   changeBackButtonColorToBlue(for: self)
        try! reachability.startNotifier()
      //  animationView.isHidden = true
  checkFavoritesIfEmpty()
        self.title = "Favorites"
     
    }
    func checkFavoritesIfEmpty()
    {
        if viewModel.isFavoritesEmpty()
        {
            animationView.isHidden = false
            tableView.isHidden = true
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
        }
        else
        {
            
            animationView.isHidden = true
            animationView.stop()
            tableView.isHidden = false
        }
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bindingViewModel()
        viewModel.getFavoriteTeamsFromDatabase()
        checkFavoritesIfEmpty()
        
       
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
                self.checkFavoritesIfEmpty()
          
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
        
        switch reachability.connection {
        case .wifi, .cellular:
            print("Internet connection is available.")
            let vC = self.storyboard?.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController
            vC.teamId = viewModel.getTeamId(index: indexPath.row)
            self.navigationController?.pushViewController(vC, animated: true)
        case .unavailable:
            print("Internet connection is unavailable.")
            
       Alerts.makeConfirmationDialogue(message: "Please check your internet connection to be able to view details")
            
        case .none:
            print("no internet")
        }
 
    }
}
