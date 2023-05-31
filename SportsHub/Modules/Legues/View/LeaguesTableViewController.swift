//
//  FootBallLeaguesTableViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 21/05/2023.
//

import UIKit
import SDWebImage

class LeaguesTableViewController: UITableViewController {

    var viewModel = LeagueViewModel()
let indicator = Indicator()
    var gameName:String?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
      //  tableView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        indicator.setUpNetworkIndicator(view: view)
        bindingViewModel()
        indicator.startIndicator()
        
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
                    self.indicator.stopIndicator()
                }
            }

        }
    }

    override func viewDidAppear(_ animated: Bool) {
        if let param = gameName
        {
            viewModel.getLeagues(param: param)
            
        }
            else
            {
                print("error")
            }
    }


    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.getLeaguesArrayCount()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vC = self.storyboard?.instantiateViewController(identifier: "LeaguesDetailsViewController") as! LeaguesDetailsViewController
        vC.leagueId = viewModel.getLeaagueKey(index: indexPath.row)
        vC.gameName = gameName
          self.navigationController?.pushViewController(vC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
  
        cell.configureCell(league: viewModel.getLeague(index: indexPath.row))
 
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    

    
    
}


