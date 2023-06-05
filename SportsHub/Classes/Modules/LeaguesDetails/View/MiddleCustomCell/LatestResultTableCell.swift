//
//  LatestResultTableCell.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 24/05/2023.
//

import UIKit

class LatestResultTableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      setImageStyle(image:firstTeamImage)
        setImageStyle(image: secondTeamImage)
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(event:Event, gameName:String)
    {

        if let homeTeamImage = event.home_team_logo
              {
       firstTeamImage.sd_setImage(with: URL(string: homeTeamImage ), placeholderImage: UIImage(named: "Placeholder.png"))
         }
        if let awayTeamImage = event.away_team_logo
                    {
            secondTeamImage.sd_setImage(with: URL(string: awayTeamImage ), placeholderImage: UIImage(named: "Placeholder.png"))
               }

       firstTeamName.text = event.event_home_team
       secondTeamName.text = event.event_away_team
        date.text = event.event_date
        score.text = event.event_final_result
        time.text = event.event_time
        
        if(gameName=="cricket")
        {
            date.text = event.event_date_start
            let team1 =  event.event_home_final_result ?? ""
            let team2 =  event.event_away_final_result ?? ""
            score.text = "Team 1: \(team1)\n Team 2: \(team2)"
        }

   
        if(gameName == "tennis")
        {
         firstTeamName.text = event.event_first_player
          secondTeamName.text = event.event_second_player
    
        }


    }
    
   
    @IBOutlet weak var secondTeamImage: UIImageView!
    @IBOutlet weak var firstTeamName: UILabel!
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var firstTeamImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!

    @IBOutlet weak var score: UILabel!
}
