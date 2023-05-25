//
//  Teams.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 25/05/2023.
//

import UIKit

class Teams: Decodable {
    var success:Int?
    var result:[Team]?
}

class Team:Decodable
{
    var team_logo:String?
    var team_name:String?
    var team_key:Int?
}
class FootballTeam:Decodable
{
    var success:Int?
    var result: [TeamDetails]?
    
}
class TeamDetails:Decodable{
    var team_name:String?
    var team_logo:String?
    var players:[Player]?
    var coaches:[Coach]?
    
}

class Player:Decodable {
    var player_name:String?
    var player_number:String?
    var player_age:String?
    var player_type:String?
    var player_image:String?
}

class Coach:Decodable{
    var coach_name:String?
}


