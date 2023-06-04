//
//  TeamsCell.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 24/05/2023.
//

import UIKit

class TeamsCell: UICollectionViewCell {
    
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
        
    
    func configureCell(team:Team)
       {
           
            if let teamImage = team.team_logo
                  {
               teamLogo.sd_setImage(with: URL(string: teamImage ), placeholderImage: UIImage(named: "Placeholder.png"))
             }
        teamName.text = team.team_name
       }
    
    func configurePlayerCell(player: TennisPlayer)
    {
//        if let playerLogo = player.player_logo
//              {
//           teamLogo.sd_setImage(with: URL(string: playerLogo ), placeholderImage: UIImage(named: "Placeholder.png"))
//         }
        teamName.text = player.player_name
        teamLogo.image = UIImage(named: "tennisPlayer.png")
    }
}
