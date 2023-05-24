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
        // Do any additional setup after loading the view.
       tableView.register(UINib(nibName: "LatestResultTableCell", bundle: nil), forCellReuseIdentifier: "middleCell")
        
        
        topCollectionView.register(UINib(nibName: "UpComingEventsCell", bundle: nil), forCellWithReuseIdentifier: "upperCell")
 
       
        if let gameName = gameName, let leagueId = leagueId
        { print("leagueID= \(leagueId) and gameName= \(gameName)")
            viewModel.getUpComingEvents(sportName: gameName , leagueId: leagueId)
            {
                result in
                
                self.upComingEventArray = result
                print("I have: \(String(describing: result?[0].event_date))")
                
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
   
        
    }
 
}

extension LeaguesDetailsViewController:UICollectionViewDelegate,UICollectionViewDataSource
,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upComingEventArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let upperCell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                "upperCell", for: indexPath) as! UpComingEventsCell
        
        
     //   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCell", for: indexPath) as! TeamsCell
        setUpperCell(upperCell: upperCell, indexPath: indexPath)
 
        return upperCell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
//    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
//        return CGSize(width: topCollectionView.frame.size.width, height: topCollectionView.frame.size.height)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: topCollectionView.frame.size.width, height: topCollectionView.frame.size.height)

    }
    
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
        
//        cell.firstTeamName.text = upComingEventArray[indexPath.row].event_home_team
//        cell.secondTeamName.text = upComingEventArray[indexPath.row].event_away_team
        upperCell.dateLabel.text = upComingEventArray?[indexPath.row].event_date
        upperCell.timeLabel.text = upComingEventArray?[indexPath.row].event_time
        upperCell.eventName.text = upComingEventArray?[indexPath.row].league_name
        
    }
}
