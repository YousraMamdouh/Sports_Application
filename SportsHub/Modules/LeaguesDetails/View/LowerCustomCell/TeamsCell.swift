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
}
