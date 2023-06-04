//
//  Style.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 25/05/2023.
//

import UIKit


extension UIView
    {
 func setImageStyle(image:UIImageView) {
       // image.layer.borderWidth = 1
        image.layer.masksToBounds = false
       // image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
     }
 func setCellStyle(view:UIView)
    {
        //view.layer.borderColor = UIColor(named: "#48BFBE")?.cgColor
      // view.layer.borderColor = UIColor.red.cgColor
        let customColor = UIColor(named: "lightBlue")
        view.layer.borderColor = customColor?.cgColor
        view.layer.borderWidth = 0.7
       view.layer.cornerRadius = 20
    }
    
  
}

extension UIViewController
{
    func changeBackButtonColorToBlue(for viewController: UIViewController) {
         viewController.navigationController?.navigationBar.tintColor = UIColor(named: "lightBlue")
     }
}
