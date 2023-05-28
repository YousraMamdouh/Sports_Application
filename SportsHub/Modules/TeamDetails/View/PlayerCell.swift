//
//  PlayerCell.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 25/05/2023.
//

import UIKit

class PlayerCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCellStyle(view: backView)
        
    }
    
    func configureCell(player:Player)
    {
        
        if let image = player.player_image
               {
             playerImage.sd_setImage(with: URL(string: image ), placeholderImage: UIImage(named: "Player.jpg"))
          }
           
       playerAge.text = player.player_age
      playerName.text = player.player_name
      playerNumber.text = player.player_number
       playerType.text = player.player_type
    }

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerType: UILabel!
    @IBOutlet weak var playerNumber: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerAge: UILabel!
}
