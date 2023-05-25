//
//  ApiService.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 22/05/2023.
//

import UIKit

class Network {

    public static var shared = Network()
    
   private init() {
        
    }
    public var API_KEY: String
    {
        get{
            return "c9a13732377d308c4f8293321d1834a5901ba3166630bbf70bf11313e0b1d05f"
        }
    }
    public var BASE_URL: String
    {
        get{
            return "https://apiv2.allsportsapi.com/"
        }
    }
    
    func getAllLeagues(param:String)->String
    {
        return "\(BASE_URL)\(param)/?met=Leagues&APIkey=\(API_KEY)"
    }
//"https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=c9a13732377d308c4f8293321d1834a5901ba3166630bbf70bf11313e0b1d05f"
    
    func getUpcomingEvents(sportName:String,leagueId:Int) -> String
    {
      
        switch(sportName)
        {
        case "football":
            return "\(BASE_URL)\(sportName)/?met=Fixtures&APIkey=\(API_KEY)&from=2022-01-23&to=2023-12-30&leagueId=\(leagueId)"
        case "basketball":
            return "\(BASE_URL)\(sportName)/?met=Fixtures&APIkey=\(API_KEY)&from=2023-01-23&to=2023-12-30&leagueId=\(leagueId)"
        case "cricket":
            return "\(BASE_URL)\(sportName)/?met=Fixtures&APIkey=\(API_KEY)&from=2022-01-23&to=2023-12-30&leagueId=\(leagueId)"
        case "tennis":
            return "\(BASE_URL)\(sportName)/?met=Fixtures&APIkey=\(API_KEY)&from=2020-05-23&to=2025-06-30&leagueId=\(leagueId)"
        default:
            return "\(BASE_URL)\(sportName)/?met=Fixtures&APIkey=\(API_KEY)&from=2023-05-10&to=2023-05-23&leagueId=\(leagueId)"
        }
//"https://apiv2.allsportsapi.com/tennis/?met=Fixtures&leagueId=2&from=2023-05-09&to=2024-02-09&APIkey=c9a13732377d308c4f8293321d1834a5901ba3166630bbf70bf11313e0b1d05f"
        
        //"https://apiv2.allsportsapi.com/cricket/?met=Fixtures&APIkey=73c2f608d71c07237af2b5e3b4f14237cf16a8f5fe0257f5e95c24171967b1fc&from=2022-01-23&to=2023-12-30&leagueId=733"

    }
    func getLatestEvents(sportName:String,leagueId:Int)->String
    {
        switch(sportName)
        {
        case "football":
            return "\(BASE_URL)\(sportName)/?met=Fixtures&APIkey=\(API_KEY)&from=2023-05-10&to=2023-05-23&leagueId=\(leagueId)"
        case "basketball":
            return "\(BASE_URL)\(sportName)/?met=Fixtures&APIkey=\(API_KEY)&from=2023-01-23&to=2023-12-30&leagueId=\(leagueId)"
        case "cricket":
            return "\(BASE_URL)\(sportName)/?met=Fixtures&APIkey=\(API_KEY)&from=2022-01-23&to=2023-12-30&leagueId=\(leagueId)"
        case "tennis":
            return "\(BASE_URL)\(sportName)/?met=Fixtures&APIkey=\(API_KEY)&from=2020-05-23&to=2025-06-30&leagueId=\(leagueId)"
        default:
            return "\(BASE_URL)\(sportName)/?met=Fixtures&APIkey=\(API_KEY)&from=2023-05-10&to=2023-05-23&leagueId=\(leagueId)"
        }
      
// "https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=c9a13732377d308c4f8293321d1834a5901ba3166630bbf70bf11313e0b1d05f&from=2023-05-10&to=2023-05-23&leagueId=3"
    }
    
    func getTeams(sportName:String,leagueId:Int) -> String
    {
        return "\(BASE_URL)\(sportName)/?met=Teams&?met=Leagues&leagueId=\(leagueId)&APIkey=\(API_KEY)"

    }
}
