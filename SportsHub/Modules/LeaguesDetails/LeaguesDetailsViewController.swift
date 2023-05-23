//
//  LeaguesViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 23/05/2023.
//

import UIKit

class LeaguesDetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
       tableView.register(UINib(nibName: "LatestResultTableCell", bundle: nil), forCellReuseIdentifier: "middleCell")
     tableView.register(UINib(nibName: "UpComingEventsCell", bundle: nil), forCellReuseIdentifier: "upperCell")
   
    }
    

 }
extension LeaguesDetailsViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let middleCell = tableView.dequeueReusableCell(withIdentifier:
                                                "middleCell", for: indexPath) as! LatestResultCell
        return middleCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    
 
}
