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
        // Initialization code
//        let border = CALayer()
//
//           let borderWidth: CGFloat = 1
//
//        let myCustomColor = UIColor(red: 7.2, green: 19.1, blue: 19.0, alpha: 1.0)
//        border.backgroundColor = myCustomColor.cgColor
//           // Set the color your want
//
//
//           // Create a rect only on the right of the view
//           border.frame = CGRect(x: bounds.maxX - borderWidth,
//                                 y: 0,
//                                 width: borderWidth,
//                                 height: bounds.maxY)
//
//           layer.addSublayer(border)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
