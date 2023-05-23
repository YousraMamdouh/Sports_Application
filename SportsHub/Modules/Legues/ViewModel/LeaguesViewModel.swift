//
//  LeaguesViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 22/05/2023.
//

import UIKit

class LeaguesViewModel{

 
    
    func numberOfSection()->Int{
        1
    }
    
    func numberOfRows(in section: Int)-> Int{
        // print("bosili 3dad: \(getLeagues()?.result?.count ?? 0)")
        return 10
    }
    func getLeagues(param:String,complitionHandler: @escaping (FootballLeagues?)-> Void)
    {
        APICaller.getLeagues(param: param) {
            result in
  
            complitionHandler(result)

        }
        
  
    }
    
    func sentTheParamToTheAPI(param:String)
    {
        
    }
    
}
