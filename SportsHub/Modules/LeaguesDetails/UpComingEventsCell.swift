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
    func setImageStyle(image:UIImageView) {
       // image.layer.borderWidth = 1
        image.layer.masksToBounds = false
       // image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
     }
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var firstTeamImage: UIImageView!
    @IBOutlet weak var secondTeamImage: UIImageView!
    @IBOutlet weak var eventName: UILabel!

    @IBOutlet weak var timeLabel: UILabel!
    
}

