//
//  LeaguesViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 22/05/2023.
//

import UIKit

class LeagueDetailsViewModel{
    var isLoading: Observable<Int> = Observable(0)
    var upcomingEvents:[Event] = []
    var latestEvents:[Event] = []
    var teams: [Team] = []
    var players: [TennisPlayer] = []
    var isLoadingTemp = 0

 
    // MARK: - UpComingEvents section
    
    func getUpComingEvents(sportName: String, leagueId: Int)
       {
           APICaller.getUpcomingEvents(sportName: sportName, leagueId: leagueId)
           {
               result in
               self.upcomingEvents = result.result ?? []
               self.isLoadingTemp = self.isLoadingTemp + 1
               self.isLoading.value = self.isLoadingTemp
              // complitionHandler()
               
           }
           
   
       }
    
    func getUpComingEventsCount()-> Int
    {
        

      return  upcomingEvents.count
    }
    
    func getUpComingEvent(index:Int)-> Event
    {
        upcomingEvents[index]
    }
    
    
    
    // MARK: - LatestEvents section
    
    func getLatestEvents(sportName:String,leagueId:Int)
   {
       APICaller.getLatestEvents(sportName: sportName, leagueId: leagueId)
       {
           result in
           self.latestEvents = result.result ?? []
           self.isLoadingTemp = self.isLoadingTemp + 1
           self.isLoading.value = self.isLoadingTemp
 
       //   complitionHandler()
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
    
    
    func getTeams(sportName:String,leagueId:Int)
    {
        APICaller.getTeams(sportName: sportName, leagueId: leagueId)
        {
            result in
            self.teams = result.result ?? []
            self.isLoadingTemp = self.isLoadingTemp + 1
            self.isLoading.value = self.isLoadingTemp
          // complitionHandler()
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
    
    
    //MARK: Tennis players
    
    func getPlayers(leagueId:Int)
    {
        APICaller.getTennisPlayers(leagueId: leagueId)
        {
            result in
            self.players = result.result ?? []
            self.isLoadingTemp = self.isLoadingTemp + 1
            self.isLoading.value = self.isLoadingTemp
          // complitionHandler()
        }
    }
    func getPlayers()-> Int
    {
        players.count
    }
    
    func getPlayer(index:Int)-> TennisPlayer
    {
       players[index]
    }
    
   
    
}

