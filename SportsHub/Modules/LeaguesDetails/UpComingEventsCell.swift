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
    }

    @IBOutlet weak var firstTeamImage: UIImageView!
    @IBOutlet weak var secondTeamImage: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBAction func date(_ sender: Any) {
    }
    @IBAction func time(_ sender: Any) {
    }

}

