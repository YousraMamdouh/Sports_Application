//
//  Indicator.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 31/05/2023.
//

import UIKit

class Indicator {
    var networkIndicator = UIActivityIndicatorView(style: .large)
    func setUpNetworkIndicator( view: UIView!) {
        networkIndicator.color = UIColor(named: "lightBlue")
        networkIndicator.center = view.center
        view.addSubview(networkIndicator)
    }
//    init(view: UIView!)
//    {
//        networkIndicator.color = UIColor(named: "lightBlue")
//        networkIndicator.center = view.center
//        view.addSubview(networkIndicator)
//    }
    
    func startIndicator()
    {
        networkIndicator.startAnimating()
    }

    func stopIndicator()
    {
        networkIndicator.stopAnimating()
    }
}
