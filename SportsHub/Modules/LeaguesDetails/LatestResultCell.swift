//
//  LatestResultCell.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 23/05/2023.
//

import UIKit

class LatestResultCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        // Initialization code
    }

    @IBAction func time(_ sender: Any) {
    }
    @IBAction func date(_ sender: Any) {
    }
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var firstTeamImage: UIImageView!
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var secondTeamImage: UIImageView!
    @IBOutlet weak var firstTeamName: UILabel!
}
