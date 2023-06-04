//
//  UpComingEvents.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 24/05/2023.
//

import UIKit

class Event:Decodable {
    // Football & basketball
    var event_date:String?
    var event_time:String?
    var home_team_logo:String?
    var away_team_logo:String?
    var event_home_team:String?
    var event_away_team:String?
    var league_name:String?
    var event_final_result:String?
    
    //Cricket
    var event_away_team_logo:String?
    var event_home_team_logo:String?
    var event_end_date:String?
    
    // tennis
    var event_first_player:String?
    var event_second_player:String?
    var event_first_player_logo:String?
    var event_second_player_logo:String?
    
    
}

class Events:Decodable{
    var result:[Event]?
    var success:Int?
}

//struct FootballAndBasketball {
//   
//    var event_date:String?
//    var event_time:String?
//    var home_team_logo:String?
//    var away_team_logo:String?
//    var event_home_team:String?
//    var event_away_team:String?
//    var league_name:String?
//    var event_final_result:String?
//    
//    init (_ leagues : [Event]){
//        for league in leagues{
//            event_date = league.event_date
//            event_time = league.event_date
//            home_team_logo = league.home_team_logo
//            away_team_logo = league.event_away_team_logo
//            event_home_team = league.event_home_team
//            event_away_team = league.event_away_team
//            league_name = league.league_name
//            event_final_result = league.event_final_result
//        }
//    }
//}
//
//struct Tennis{
//    var event_date:String?
//    var event_time:String?
//    var league_name:String?
//    var event_final_result:String?
//    var event_first_player:String?
//    var event_second_player:String?
//    var event_first_player_logo:String?
//    var event_second_player_logo:String?
//    
//    init (_ leagues : [Event]){
//        for league in leagues{
//            event_date = league.event_date
//            event_time = league.event_date
//            event_first_player = league.event_first_player
//            event_second_player = league.event_second_player
//            event_first_player_logo = league.event_first_player_logo
//            event_second_player_logo = league.event_second_player_logo
//            league_name = league.league_name
//            event_final_result = league.event_final_result
//        }
//    }
//}
//
//struct Cricket{
//    var event_date:String?
//    var event_time:String?
//    var league_name:String?
//    var event_first_player:String?
//    var event_second_player:String?
//    var event_away_team_logo:String?
//    var event_home_team_logo:String?
//    var event_end_date:String?
//    
//    init (_ leagues : [Event]){
//        for league in leagues{
//            event_date = league.event_date
//            event_time = league.event_date
//            event_first_player = league.event_first_player
//            event_second_player = league.event_second_player
//            event_home_team_logo = league.event_home_team_logo
//            event_away_team_logo = league.event_away_team_logo
//            league_name = league.league_name
//            event_end_date = league.event_end_date
//        }
//    }
  
//}
