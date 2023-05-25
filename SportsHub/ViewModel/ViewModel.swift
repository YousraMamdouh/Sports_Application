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
    
// func getUpComingEvents(sportName: String, leagueId: Int,complitionHandler: @escaping ([Any]?)-> Void)
//    {
//        APICaller.getUpcomingEvents(sportName: sportName, leagueId: leagueId)
//        {result in
//            print("geeet ahoh")
//
//            switch(sportName)
//            {
//
//            case "cricket":
//                complitionHandler([Cricket(result.result ?? [])] as! [Cricket])
//            case "tennis":
//                complitionHandler([Tennis(result.result ?? [])] as! [Tennis])
//            default:
//                print("viewModel result: \(result.result?.count)")
//                let test = FootballAndBasketball(result.result ?? [])
//                complitionHandler([FootballAndBasketball(result.result ?? [])] )
//             //   print("viewModel football: \(test)")
//            }
//
//        }
//    }
    
    func getUpComingEvents(sportName: String, leagueId: Int,complitionHandler: @escaping ([Event]?)-> Void)
       {
           APICaller.getUpcomingEvents(sportName: sportName, leagueId: leagueId)
           {result in
           
            
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
    
    func getTeams(sportName:String,leagueId:Int,complitionHandler: @escaping ([Team]?)-> Void)
    {
        APICaller.getTeams(sportName: sportName, leagueId: leagueId)
        {
            result in
  
           complitionHandler(result.result)
        }
    }
    
}

