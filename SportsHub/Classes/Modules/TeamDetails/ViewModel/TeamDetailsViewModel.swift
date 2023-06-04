//
//  LeaguesTableViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 25/05/2023.
//

import UIKit

class TeamDetailsViewModel {
    var observable:Observable<Bool> = Observable(false)
    var team:TeamDetails?
    var teamPlayers:[Player]?
    
    
    // MARK: - dealing with netwrok
    func getFootballTeamDetails(teamId:Int,complitionHandler: @escaping ()-> Void)
    {observable.value = false
        APICaller.getFootballTeamDetails(teamId: teamId)
        {
            result in
            self.team = result.result?[0]
            self.teamPlayers = result.result?[0].players
            self.observable.value = true
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
    
   // MARK:
    
    func insertTeamInDatabase(name:String, id:Int)
    {
        TeamsCoreData.shared.InsertTeamInDatabase(name: name, id: id)
       
    
    }
  
}
