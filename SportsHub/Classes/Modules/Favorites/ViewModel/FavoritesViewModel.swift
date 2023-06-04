//
//  FavoritesViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 29/05/2023.
//

import UIKit

class FavoritesViewModel{
    var observable: Observable <Bool> = Observable(false)
    var teamsFavoriteArray: [Favorites] = []

    
    
    func insertTeamInDatabase(name:String, id:Int)
    {
        TeamsCoreData.shared.InsertTeamInDatabase(name: name, id: id)
        observable.value = true
    }

    
    func getTeamsCount()-> Int
    {
        return teamsFavoriteArray.count
    }
    
    func getFavoriteTeamsFromDatabase()
    {
        teamsFavoriteArray = []

         let result =  TeamsCoreData.shared.getDataFromDataBase()
         observable.value = false
          
            for team in result {
                let name = team.value(forKey: "name") as! String
                let id = team.value(forKey: "id") as! Int
                let team = Favorites(name: name, id: id)
            teamsFavoriteArray.append(team)
             observable.value = true
 
        }
    
    }
    
    func getTeam(index:Int)-> Favorites
    {
        return teamsFavoriteArray[index]
    }
    
    

    func deleteTeamFromDatabase(index:Int)
    
    {
        TeamsCoreData.shared.deleteTeamFromDatabase(id:teamsFavoriteArray[index].id ?? 0)
            self.teamsFavoriteArray.remove(at: index)
            self.observable.value = true
       
        
    }
    
    func getTeamId(index: Int)-> Int
    {
        teamsFavoriteArray[index].id ?? 0
    }
    
    func isFavoritesEmpty()-> Bool
    {
        if teamsFavoriteArray.isEmpty
        {
            return true
        }
        else
        {
            return false
        }
    }
 
}
