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
  
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var firstTeamImage: UIImageView!
    @IBOutlet weak var secondTeamImage: UIImageView!
    @IBOutlet weak var eventName: UILabel!

    @IBOutlet weak var timeLabel: UILabel!
    
}

