//
//  SportCollectionViewCell.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 20/05/2023.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }

    @IBOutlet weak var sportLabel: UILabel!
    
    @IBOutlet weak var sportImage: UIImageView!
}
