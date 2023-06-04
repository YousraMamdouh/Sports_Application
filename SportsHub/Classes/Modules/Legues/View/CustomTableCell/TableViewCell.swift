//
//  TableViewCell.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 21/05/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var leagueImage: UIImageView!
    @IBOutlet weak var leagueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setCellStyle(view: backView)
        setImageStyle(image: leagueImage)
        
       

//        self.layoutMargins = UIEdgeInsets.zero //or UIEdgeInsetsMake(top, left, bottom, right)
//        self.separatorInset = UIEdgeInsets.zero //if you also want to adjust separatorInset
      
    }
  
   
    
    @IBOutlet weak var backView: UIView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(league:FootballLeague)
    {
       leagueLabel.text = league.league_name
      //  print("look\(response?.result?[indexPath.row].league_name)")
        if let imageURL = league.league_logo
        {
          leagueImage.sd_setImage(with: URL(string: imageURL ), placeholderImage: UIImage(named: "Placeholder.png"))
          
        }
        else
        {
            leagueImage.image = UIImage(named: "Placeholder.png")
        }
    }
    
    func configureTeamCell(team: Favorites)
    {
        leagueLabel.text = team.name
    }
    
    
}
