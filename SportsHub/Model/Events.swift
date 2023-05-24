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


