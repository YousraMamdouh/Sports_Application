//
//  LeaguesViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 22/05/2023.
//

import UIKit

class ViewModel{

 

    func getLeagues(param:String,complitionHandler: @escaping (FootballLeagues?)-> Void)
    {
        APICaller.getLeagues(param: param) {
            result in
  
            complitionHandler(result)

        }
        
  
    }
    
    func gettingImageWithURL(param:String)
    {
        
    }
    
}
