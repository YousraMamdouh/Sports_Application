//
//  LeaguesTableViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 25/05/2023.
//

import UIKit

class TeamDetailsViewModel {
    
    var team:TeamDetails?
    var teamPlayers:[Player]?
    
    func getFootballTeamDetails(teamId:Int,complitionHandler: @escaping ()-> Void)
    {
        APICaller.getFootballTeamDetails(teamId: teamId)
        {
            result in
            self.team = result.result?[0]
            self.teamPlayers = result.result?[0].players
            complitionHandler()
        }
    }
    
    
    func getTeam()-> TeamDetails
    {
        return team ?? TeamDetails()
       
    }
    
    func getPlayer(index:Int)-> Player
    {
        return teamPlayers?[index] ?? Player()
        
    }
    
    
    func getPlayersCount()-> Int{
        teamPlayers?.count ?? 0
    }
  
}

