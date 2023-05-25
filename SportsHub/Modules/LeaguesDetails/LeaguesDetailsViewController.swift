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
    var upComingEventArray: [Event]?
    var latestEventsArray: [Event]?
    var teamsArray: [Team]?
    let viewModel = ViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    @IBOutlet weak var topCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        bottomCollectionView.dataSource = self
        bottomCollectionView.delegate = self
        // Do any additional setup after loading the view.
       tableView.register(UINib(nibName: "LatestResultTableCell", bundle: nil), forCellReuseIdentifier: "middleCell")
        
        
        topCollectionView.register(UINib(nibName: "UpComingEventsCell", bundle: nil), forCellWithReuseIdentifier: "upperCell")
 
       
        if let gameName = gameName, let leagueId = leagueId
        { print("leagueID= \(leagueId) and gameName= \(gameName)")
            print("county:\(upComingEventArray?.count)")
            viewModel.getUpComingEvents(sportName: gameName , leagueId: leagueId)
            {
                result in
                print("county upcoming:\(self.upComingEventArray?.count)")
                self.upComingEventArray = result
                print("county result:\(result?.count)")
                DispatchQueue.main.async {
                
                    self.topCollectionView.reloadData()
    
                }
           
            }
            
            viewModel.getLatestEvents(sportName: gameName, leagueId: leagueId){
                result in
                self.latestEventsArray = result
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
         
                }
            }
            
            viewModel.getTeams(sportName: gameName, leagueId: leagueId, complitionHandler: {
                
                result in
                self.teamsArray = result
                
                DispatchQueue.main.async {
                    self.bottomCollectionView.reloadData()
         
                }
                
            })
        }
        else
        {
            print("fadyeen")
        }
 
   
    }
    

 }
extension LeaguesDetailsViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return latestEventsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let middleCell = tableView.dequeueReusableCell(withIdentifier:
                                                "middleCell", for: indexPath) as! LatestResultTableCell

     setMiddleCell(middleCell: middleCell, indexPath: indexPath)
        
        return middleCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }


    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 140
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 200
    }
    
    func setMiddleCell( middleCell:LatestResultTableCell,indexPath: IndexPath)
    {

        if let homeTeamImage = upComingEventArray?[indexPath.row].home_team_logo
              {
          middleCell.firstTeamImage.sd_setImage(with: URL(string: homeTeamImage ), placeholderImage: UIImage(named: "Placeholder.png"))
         }
              if let awayTeamImage = upComingEventArray?[indexPath.row].away_team_logo
                    {
                middleCell.secondTeamImage.sd_setImage(with: URL(string: awayTeamImage ), placeholderImage: UIImage(named: "Placeholder.png"))
               }

        middleCell.firstTeamName.text = latestEventsArray?[indexPath.row].event_home_team
     middleCell.secondTeamName.text = latestEventsArray?[indexPath.row].event_away_team
      middleCell.date.text = latestEventsArray?[indexPath.row].event_date
        middleCell.time.text = latestEventsArray?[indexPath.row].event_time
        middleCell.score.text = latestEventsArray?[indexPath.row].event_final_result
        if(gameName == "tennis")
        {
            middleCell.firstTeamName.text = latestEventsArray?[indexPath.row].event_first_player
            middleCell.secondTeamName.text = latestEventsArray?[indexPath.row].event_second_player
    
        }


    }

}

extension LeaguesDetailsViewController:UICollectionViewDelegate,UICollectionViewDataSource
,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch (collectionView)
        {
        case topCollectionView:
            return upComingEventArray?.count ?? 0
        case bottomCollectionView:
            return teamsArray?.count ?? 0
        default:
            return 0
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let upperCell = topCollectionView.dequeueReusableCell(withReuseIdentifier:
                                                "upperCell", for: indexPath) as! UpComingEventsCell
        
        
       let cell = bottomCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCell", for: indexPath) as! TeamsCell
        setUpperCell(upperCell: upperCell, indexPath: indexPath)
 switch(collectionView)
        {
 case bottomCollectionView:
     setLowerCell(lowerCell: cell, indexPath: indexPath)
     return cell
 default:
     return upperCell
 }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
//    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
//        return CGSize(width: topCollectionView.frame.size.width, height: topCollectionView.frame.size.height)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        switch(collectionView)
               {
       
            
        case bottomCollectionView:
            return CGSize(width: topCollectionView.frame.size.width/2, height: topCollectionView.frame.size.height)
        default:
            return CGSize(width: topCollectionView.frame.size.width, height: topCollectionView.frame.size.height)
        }
     

    }
    
//    func setUpperCell( upperCell:UpComingEventsCell,indexPath: IndexPath)
//    {
//        switch gameName{
//
//
//        case "tennis":
//          let  tennisLeagueDetailsArray = upComingEventArray as! [Tennis]
//
//            upperCell.dateLabel.text = tennisLeagueDetailsArray[indexPath.row].event_date
//            upperCell.timeLabel.text = tennisLeagueDetailsArray[indexPath.row].event_time
//            upperCell.eventName.text = tennisLeagueDetailsArray[indexPath.row].league_name
//
//            print("bosy:\(tennisLeagueDetailsArray.count)")
//
//        case "cricket":
//            let cricketLeaguesArray = upComingEventArray as! [Cricket]
//            upperCell.dateLabel.text = cricketLeaguesArray[indexPath.row].event_date
//            upperCell.timeLabel.text = cricketLeaguesArray[indexPath.row].event_time
//            upperCell.eventName.text = cricketLeaguesArray[indexPath.row].league_name
//        default:
//            let defaultLeagueDetailsArray = upComingEventArray as! [FootballAndBasketball]
//
//
//            if let homeTeamImage = defaultLeagueDetailsArray[indexPath.row].home_team_logo
//                  {
//                upperCell.firstTeamImage.sd_setImage(with: URL(string: homeTeamImage ), placeholderImage: UIImage(named: "Placeholder.png"))
//             }
//                  if let awayTeamImage = defaultLeagueDetailsArray[indexPath.row].away_team_logo
//                        {
//                      upperCell.secondTeamImage.sd_setImage(with: URL(string: awayTeamImage ), placeholderImage: UIImage(named: "Placeholder.png"))
//                   }
//
//
//            upperCell.dateLabel.text = defaultLeagueDetailsArray[indexPath.row].event_date
//            upperCell.timeLabel.text = defaultLeagueDetailsArray[indexPath.row].event_time
//            upperCell.eventName.text = defaultLeagueDetailsArray[indexPath.row].league_name
//
//
//        }
//
//
//
//    }
    func setUpperCell( upperCell:UpComingEventsCell,indexPath: IndexPath)
    {
    
           
            if let homeTeamImage = upComingEventArray?[indexPath.row].home_team_logo
                  {
                upperCell.firstTeamImage.sd_setImage(with: URL(string: homeTeamImage ), placeholderImage: UIImage(named: "Placeholder.png"))
             }
                  if let awayTeamImage = upComingEventArray?[indexPath.row].away_team_logo
                        {
                      upperCell.secondTeamImage.sd_setImage(with: URL(string: awayTeamImage ), placeholderImage: UIImage(named: "Placeholder.png"))
                   }
            

            upperCell.dateLabel.text = upComingEventArray?[indexPath.row].event_date
            upperCell.timeLabel.text = upComingEventArray?[indexPath.row].event_time
            upperCell.eventName.text = upComingEventArray?[indexPath.row].league_name
            
            
        }
    func setLowerCell(lowerCell: TeamsCell,indexPath: IndexPath)
    {
        
         if let teamImage = teamsArray?[indexPath.row].team_logo
               {
             lowerCell.teamLogo.sd_setImage(with: URL(string: teamImage ), placeholderImage: UIImage(named: "Placeholder.png"))
          }
        lowerCell.teamName.text = teamsArray?[indexPath.row].team_name
    }
        
        
        
    
}
