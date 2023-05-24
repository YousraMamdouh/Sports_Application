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
    
 func getUpComingEvents(sportName: String, leagueId: Int,complitionHandler: @escaping ([Event]?)-> Void)
    {
        APICaller.getUpcomingEvents(sportName: sportName, leagueId: leagueId)
        {
            result in
  
            complitionHandler(result.result)
        }
    }
    
     func getLatestEvents(sportName:String,leagueId:Int,complitionHandler: @escaping ([Event]?)-> Void)
    {
        APICaller.getLatestEvents(sportName: sportName, leagueId: leagueId)
        {
            result in
  
           complitionHandler(result.result)
        }
    }
    
}

