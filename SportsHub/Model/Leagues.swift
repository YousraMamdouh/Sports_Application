//
//  Leagues.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 22/05/2023.
//

import UIKit

class Leagues {

}

class FootballLeague:Decodable{
    var league_key: Int?
    var league_name: String?
    var country_key:Int?
    var country_name:String?
    var league_logo:String?
    
}
class FootballLeagues:Decodable{
    var success:Int?
    var result:[FootballLeague]?
}
