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
    }
    func setImageStyle(image:UIImageView) {
       // image.layer.borderWidth = 1
        image.layer.masksToBounds = false
       // image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = leagueImage.frame.height/2
        image.clipsToBounds = true
     }
    func setCellStyle(view:UIView)
    {
      view.layer.borderColor = UIColor.label.cgColor
     view.layer.borderWidth = 1
       view.layer.cornerRadius = 10
    }
    
    @IBOutlet weak var backView: UIView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
