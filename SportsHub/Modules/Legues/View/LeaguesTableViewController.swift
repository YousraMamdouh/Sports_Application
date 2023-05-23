//
//  FootBallLeaguesTableViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 21/05/2023.
//

import UIKit
import SDWebImage

class LeaguesTableViewController: UITableViewController {

    var viewModel : ViewModel = ViewModel()
    var response: FootballLeagues?
    var gameName:String?
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
      
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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return response?.result?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        // Configure the cell...
        cell.leagueLabel.text = response?.result?[indexPath.row].league_name
        print("look\(response?.result?[indexPath.row].league_name)")
        if let imageURL = response?.result?[indexPath.row].league_logo
        {
            cell.leagueImage.sd_setImage(with: URL(string: imageURL ), placeholderImage: UIImage(named: "Placeholder.png"))
            viewModel.gettingImageWithURL(param: imageURL)
        }
        else
        {
            cell.leagueImage.image = UIImage(named: "Placeholder.png")
        }
     

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    

    
    
}


