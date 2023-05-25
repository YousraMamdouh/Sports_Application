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
