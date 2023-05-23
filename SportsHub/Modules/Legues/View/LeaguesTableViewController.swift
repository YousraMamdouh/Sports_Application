//
//  FootBallLeaguesTableViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 21/05/2023.
//

import UIKit

class LeaguesTableViewController: UITableViewController {

    var viewModel : LeaguesViewModel = LeaguesViewModel()
    var response: FootballLeagues?
    var gameName:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        print("\(gameName)")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        if let param = gameName
        {
            viewModel.getLeagues(param: param) { res in
                
                self.response = res
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
            else
            {
                print("error")
            }
        
    }




    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return response?.result?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.numberOfRows(in: section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        // Configure the cell...
        cell.leagueLabel.text = response?.result?[indexPath.row].league_name

        // Configure the cell...

        return cell
    }
    

    
}


