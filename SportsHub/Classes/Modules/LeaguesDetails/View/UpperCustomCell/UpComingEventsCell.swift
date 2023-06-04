//
//  UpComingEventsCell.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 23/05/2023.
//

import UIKit

class UpComingEventsCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.translatesAutoresizingMaskIntoConstraints = false
     setImageStyle(image: firstTeamImage)
    setImageStyle(image: secondTeamImage)
    }
  
    func configureCell( event: Event)
    {
    
           
            if let homeTeamImage = event.home_team_logo
                  {
                firstTeamImage.sd_setImage(with: URL(string: homeTeamImage ), placeholderImage: UIImage(named: "Placeholder.png"))
             }
        if let awayTeamImage = event.away_team_logo
                        {
               secondTeamImage.sd_setImage(with: URL(string: awayTeamImage ), placeholderImage: UIImage(named: "Placeholder.png"))
                   }
            

        dateLabel.text = event.event_date
        timeLabel.text = event.event_time
        eventName.text = event.league_name
            
            
        }
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var firstTeamImage: UIImageView!
    @IBOutlet weak var secondTeamImage: UIImageView!
    @IBOutlet weak var eventName: UILabel!

    @IBOutlet weak var timeLabel: UILabel!
    
}

