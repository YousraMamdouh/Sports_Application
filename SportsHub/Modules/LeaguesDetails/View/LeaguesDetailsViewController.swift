//
//  LeaguesViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 23/05/2023.
//

import UIKit
import SDWebImage

class LeaguesDetailsViewController: UIViewController {
    var leagueId: Int?
    var gameName: String?
    let viewModel = LeaguesViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    @IBOutlet weak var topCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpCollectionView()
        if let gameName = gameName, let leagueId = leagueId
        {
            viewModel.getUpComingEvents(sportName: gameName , leagueId: leagueId)
            {
                print("try")
                DispatchQueue.main.async {
                
                    self.topCollectionView.reloadData()
    
                }
           
            }
            
            viewModel.getLatestEvents(sportName: gameName, leagueId: leagueId){
           
    
                DispatchQueue.main.async {
                    self.tableView.reloadData()
         
                }
            }
            
            viewModel.getTeams(sportName: gameName, leagueId: leagueId) {
           
                
                DispatchQueue.main.async {
                    self.bottomCollectionView.reloadData()
         
                }
                
            }
        }
        else
        {
            print("no data returned")
        }
 
   
    }
    func setUpTableView()
    {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LatestResultTableCell", bundle: nil), forCellReuseIdentifier: "middleCell")
    }
    func setUpCollectionView()
    {
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        bottomCollectionView.dataSource = self
        bottomCollectionView.delegate = self
        topCollectionView.register(UINib(nibName: "UpComingEventsCell", bundle: nil), forCellWithReuseIdentifier: "upperCell")
    }

 }


extension LeaguesDetailsViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getLaestEventsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let middleCell = tableView.dequeueReusableCell(withIdentifier:
                                                "middleCell", for: indexPath) as! LatestResultTableCell

        middleCell.configureCell(event: viewModel.getLatestEvent(index: indexPath.row), gameName: gameName ?? "")
        
        return middleCell
    }
   

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 200
    }
    


}

extension LeaguesDetailsViewController:UICollectionViewDelegate,UICollectionViewDataSource
,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch (collectionView)
        {
        case topCollectionView:
            return viewModel.getUpComingEventsCount()
        case bottomCollectionView:
            return viewModel.getTeams()
        default:
            return 0
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch (collectionView)
        {
            
        case bottomCollectionView:
            
            switch(gameName)
            {
            case "football":
                let vC = self.storyboard?.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController
                vC.teamId = viewModel.getTeamId(index: indexPath.row)
                self.navigationController?.pushViewController(vC, animated: true)
                
            case "tennis":
                print("tennis")
            default:
                Alerts.makeConfirmationDialogue(message: "Oops! No team details to view")
            }
            
        default:
            return
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let upperCell = topCollectionView.dequeueReusableCell(withReuseIdentifier:
                                                "upperCell", for: indexPath) as! UpComingEventsCell
        
        
       let cell = bottomCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCell", for: indexPath) as! TeamsCell
       
 switch(collectionView)
        {
 case bottomCollectionView:
     cell.configureCell(team: viewModel.getTeam(index: indexPath.row))
     return cell
 case topCollectionView:
     upperCell.configureCell(event: viewModel.getUpComingEvent(index: indexPath.row))
     return upperCell
 default:
     return upperCell
    
 }
        
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        switch(collectionView)
               {
       
            
        case bottomCollectionView:
            return CGSize(width: topCollectionView.frame.size.width/2, height: topCollectionView.frame.size.height)
        default:
            return CGSize(width: topCollectionView.frame.size.width, height: topCollectionView.frame.size.height)
        }
     

    }
 
 
        
        
        
    
}
