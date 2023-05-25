//
//  APICaller.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 22/05/2023.
//

import UIKit
enum NetworkError:Error
{
    
}
class APICaller {
    static func getLeagues(param:String,complitionHandler: @escaping (FootballLeagues?)-> Void)
    {
        let urlString:String = Network.shared.getAllLeagues(param: param)
        guard let url = URL(string:urlString ) else
        {
            return
        }
        let req = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
                  let task = session.dataTask(with: req){ (data , respone, error) in
        
                      guard let data = data else
                      {
                        return
                      }
                      do{
                          let result = try JSONDecoder().decode(FootballLeagues.self, from: data)
                        
                          complitionHandler(result)
                      }
                      catch let error{
        
                          print(error.localizedDescription)
                        //  complitionHandler(nil)
                          }
        
                      }
        
                  task.resume()
              }
            
    static func getUpcomingEvents(sportName: String, leagueId: Int,complitionHandler: @escaping (Events)-> Void)
    {
     
        let urlString:String = Network.shared.getUpcomingEvents(sportName: sportName, leagueId: leagueId)
        guard let url = URL(string:urlString ) else
        {
            return
        }
        let req = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
                  let task = session.dataTask(with: req){ (data , respone, error) in
        
                      guard let data = data else
                      {
                        return
                      }
                      do{
                          let result = try JSONDecoder().decode(Events.self, from: data)
                      
                          complitionHandler(result)
                      }
                      catch let error{
        
                          print(error.localizedDescription)
                        //  complitionHandler(nil)
                          }
        
                      }
        
                  task.resume()
    }
  
  static func getLatestEvents(sportName:String,leagueId:Int,complitionHandler: @escaping (Events)-> Void)
    {
       
        
            let urlString:String = Network.shared.getLatestEvents(sportName: sportName, leagueId: leagueId)
            guard let url = URL(string:urlString ) else
            {
                return
            }
            let req = URLRequest(url: url)
            
            let session = URLSession(configuration: .default)
                      let task = session.dataTask(with: req){ (data , respone, error) in
            
                          guard let data = data else
                          {
                            return
                          }
                          do{
                              let result = try JSONDecoder().decode(Events.self, from: data)
                              //print(result.result?[3].league_name ?? "No Title")
                      
                              complitionHandler(result)
                          }
                          catch let error{
            
                              print(error.localizedDescription)
                            //  complitionHandler(nil)
                              }
            
                          }
            
                      task.resume()
    }
        static func getTeams(sportName:String,leagueId:Int,complitionHandler: @escaping (Teams)-> Void)
    {
        let urlString:String = Network.shared.getTeams(sportName: sportName, leagueId: leagueId)
        guard let url = URL(string:urlString ) else
        {
            return
        }
        let req = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
                  let task = session.dataTask(with: req){ (data , respone, error) in
        
                      guard let data = data else
                      {
                        return
                      }
                      do{
                          let result = try JSONDecoder().decode(Teams.self, from: data)
                          //print(result.result?[3].league_name ?? "No Title")
                  
                          complitionHandler(result)
                      }
                      catch let error{
        
                          print(error.localizedDescription)
                        //  complitionHandler(nil)
                          }
        
                      }
        
                  task.resume()
    }
    
    
    static func getFootballTeamDetails(teamId:Int,complitionHandler: @escaping (FootballTeam)-> Void)
    {
        let urlString:String = Network.shared.getFootballTeamDetails(teamId: teamId)
        guard let url = URL(string:urlString ) else
        {
            return
        }
        let req = URLRequest(url: url)
        
        let session = URLSession(configuration: .default)
                  let task = session.dataTask(with: req){ (data , respone, error) in
        
                      guard let data = data else
                      {
                        return
                      }
                      do{
                          let result = try JSONDecoder().decode(FootballTeam.self, from: data)
                          //print(result.result?[3].league_name ?? "No Title")
                  
                          complitionHandler(result)
                      }
                      catch let error{
        
                          print(error.localizedDescription)
                        //  complitionHandler(nil)
                          }
        
                      }
        
                  task.resume()
    }
    
    
}
