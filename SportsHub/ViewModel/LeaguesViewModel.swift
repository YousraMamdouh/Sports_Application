//
//  LeaguesViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 22/05/2023.
//

import UIKit

class LeaguesViewModel{

    var upcomingEvents:[Event] = []
    var latestEvents:[Event] = []
    var teams: [Team] = []

    

    
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
    
  
    
    // MARK: - getLeagues
    func getLeagues(param:String,complitionHandler: @escaping (FootballLeagues?)-> Void)
    {
        APICaller.getLeagues(param: param) {
            result in
  
            complitionHandler(result)
        }
    }

    
    // MARK: - UpComingEvents section
    
    func getUpComingEvents(sportName: String, leagueId: Int,complitionHandler: @escaping ()-> Void)
       {
           APICaller.getUpcomingEvents(sportName: sportName, leagueId: leagueId)
           {result in
               
            
               self.upcomingEvents = result.result!
            
               complitionHandler()
          
               
           }
       }
    
    func getUpComingEventsCount()-> Int
    {
        upcomingEvents.count
    }
    
    func getUpComingEvent(index:Int)-> Event
    {
        upcomingEvents[index]
    }
    
    
    
    // MARK: - LatestEvents section
    
    func getLatestEvents(sportName:String,leagueId:Int,complitionHandler: @escaping ()-> Void)
   {
       APICaller.getLatestEvents(sportName: sportName, leagueId: leagueId)
       {
           result in
           self.latestEvents = result.result ?? []
 
          complitionHandler()
       }
   }
    
    
    func getLaestEventsCount()-> Int
    {
        latestEvents.count
    }
    
    func getLatestEvent(index:Int)-> Event
    {
        latestEvents[index]
    }
    
    // MARK: - Team
    
    
    func getTeams(sportName:String,leagueId:Int,complitionHandler: @escaping ()-> Void)
    {
        APICaller.getTeams(sportName: sportName, leagueId: leagueId)
        {
            result in
            self.teams = result.result ?? []
           complitionHandler()
        }
    }
    func getTeams()-> Int
    {
        teams.count
    }
    
    func getTeam(index:Int)-> Team
    {
       teams[index]
    }
    
    func getTeamId(index:Int)-> Int
    {
        teams[index].team_key ?? 0
    }
    
}

