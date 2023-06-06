//
//  ApiService.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 22/05/2023.
//

import UIKit

class Handler {

    public static var shared = Handler()
    

   private let API_KEY: String = "c9a13732377d308c4f8293321d1834a5901ba3166630bbf70bf11313e0b1d05f"
    
    private let LATEST_FOOTBALL_DATE = "2022-01-23&to=2023-04-30"
    private let LATEST_BASKETBALL_DATE = "2022-01-23&to=2023-03-30"
    private let LATEST_TENNIS_DATE = "2020-05-23&to=2025-06-30"
    private let LATEST_CRICKET_DATE = "2022-01-23&to=2023-12-30"
    
   private let UPCOMING_FOOTBALL_DATE = "2023-05-1&to=2024-02-09"
    private let UPCOMING_TENNIS_DATE = "2020-05-23&to=2025-06-30"
   private let UPCOMING_CRICKRT_DATE = "2022-01-23&to=2023-12-30"
   private let UPCOMING_BASKETBALL_DATE = "2023-01-1&to=2024-02-09"
    
   private let  BASE_URL = "https://apiv2.allsportsapi.com/"

    
    
  
    
    func getAllLeagues(param:String)->String
    {
        return "\(BASE_URL)\(param)/?met=Leagues&APIkey=\(API_KEY)"
    }
//"https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=c9a13732377d308c4f8293321d1834a5901ba3166630bbf70bf11313e0b1d05f"
    
    func getUpcomingEvents(sportName:String,leagueId:Int) -> String
    {
      var date = ""
        switch(sportName)
        {
        case "football":
            date = UPCOMING_FOOTBALL_DATE

       case "basketball":
            date = UPCOMING_BASKETBALL_DATE

        case "cricket":
            date = UPCOMING_CRICKRT_DATE

        case "tennis":
            date = UPCOMING_TENNIS_DATE

        default:
            date = ""

        }
        
        print("url: \(BASE_URL)\(sportName)/?met=Fixtures&leagueId=\(leagueId)&from=\(date)&APIkey=\(API_KEY)")
        return "\(BASE_URL)\(sportName)/?met=Fixtures&leagueId=\(leagueId)&from=\(date)&APIkey=\(API_KEY)"
       // return "\(BASE_URL)\(sportName)/?met=Fixtures&APIkey=\(API_KEY)&from=\(date)&leagueId=\(leagueId)"
        }
//"https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=73c2f608d71c07237af2b5e3b4f14237cf16a8f5fe0257f5e95c24171967b1fc&from=2020-05-23&to=2025-06-30&leagueId=3226"
        
        //"https://apiv2.allsportsapi.com/cricket/?met=Fixtures&APIkey=73c2f608d71c07237af2b5e3b4f14237cf16a8f5fe0257f5e95c24171967b1fc&from=2022-01-23&to=2023-12-30&leagueId=733"

    
    func getLatestEvents(sportName:String,leagueId:Int)->String
    {  var date = ""
        switch(sportName)
        {
        case "football":
            date = LATEST_FOOTBALL_DATE

        case "basketball":
            date = LATEST_BASKETBALL_DATE

        case "cricket":
            date = LATEST_CRICKET_DATE

        case "tennis":
            date = LATEST_TENNIS_DATE

        default:
            date = ""

        }
        return "\(BASE_URL)\(sportName)/?met=Fixtures&APIkey=\(API_KEY)&from=\(date)&leagueId=\(leagueId)"
      
      //"https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=73c2f608d71c07237af2b5e3b4f14237cf16a8f5fe0257f5e95c24171967b1fc&from=2020-05-23&to=2025-06-30&leagueId=3226" "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=c9a13732377d308c4f8293321d1834a5901ba3166630bbf70bf11313e0b1d05f&from=2023-05-10&to=2023-05-23&leagueId=3"
        
//"https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=73c2f608d71c07237af2b5e3b4f14237cf16a8f5fe0257f5e95c24171967b1fc&from=2020-05-23&to=2025-06-30&leagueId=3226" "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=c9a13732377d308c4f8293321d1834a5901ba3166630bbf70bf11313e0b1d05f&from=2023-05-10&to=2023-05-23&leagueId=3"
    }
    //"https://apiv2.allsportsapi.com/tennis/?&met=Teams&APIkey=73c2f608d71c07237af2b5e3b4f14237cf16a8f5fe0257f5e95c24171967b1fc&leagueId=2833&teamId=5"
    //"https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=c9a13732377d308c4f8293321d1834a5901ba3166630bbf70bf11313e0b1d05f&from=2020-05-23&to=2025-06-30&leagueId=2833"
    
  //
    
    func getTeams(sportName:String,leagueId:Int) -> String
    {
        return "\(BASE_URL)\(sportName)/?met=Teams&?met=Leagues&leagueId=\(leagueId)&APIkey=\(API_KEY)"

    }
    
    func getFootballTeamDetails(teamId :Int)->String
    {
        return  "\(BASE_URL)football/?&met=Teams&teamId=\(teamId)&APIkey=\(API_KEY)"

      //  "https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=96&APIkey=c9a13732377d308c4f8293321d1834a5901ba3166630bbf70bf11313e0b1d05f"
    }
    
    
    func getTennisPlayers(leagueId:Int)->String
    {
        
        return "\(BASE_URL)tennis/?&met=Players&APIkey=\(API_KEY)&leagueId=\(leagueId)"
      //  "https://apiv2.allsportsapi.com/tennis/?&met=Players&APIkey=c9a13732377d308c4f8293321d1834a5901ba3166630bbf70bf11313e0b1d05f&leagueId=2833"
    }
}