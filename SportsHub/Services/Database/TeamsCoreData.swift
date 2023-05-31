//
//  TeamsDatabase.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 29/05/2023.
//

import UIKit
import CoreData

class TeamsCoreData {
    var context: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()
    static let shared = TeamsCoreData()
    
    func getContext() -> NSManagedObjectContext {
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return context
    }
    
    func getEntity()->NSManagedObject{
        
        let entity = NSEntityDescription.entity(forEntityName: "FavoriteTeams", in: getContext())
        let teams = NSManagedObject(entity: entity!, insertInto: getContext())
        
        return teams;
        
    }
    
    func saveContext()
    {
        do{
            try getContext().save()
            
        }catch let error as NSError{
            print(error.localizedDescription)
            
        }
    }
    
    func getDataFromDataBase()->  [NSManagedObject]
    {
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "FavoriteTeams")
        var teams : [NSManagedObject] = []
        do{
            teams =   try getContext().fetch(fetchReq)
            
        }catch let error as NSError
        {
            print(error.localizedDescription)
        }
       return teams
    }
    
    func InsertTeamInDatabase(name:String, id:Int)
    {
     
      //  print("wsalt el database ahhoh")
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "FavoriteTeams")
//                guard let entity= NSEntityDescription.entity(forEntityName: "FavoriteTeams", in: context) else{return}
                let team = getEntity()
                
                team.setValue(name, forKey: "name")
                team.setValue(id, forKey: "id")
                self.saveContext()
    }
    
    func deleteTeamFromDatabase(id:Int)
    {
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "FavoriteTeams")
        
        
        do{
            let myPredicate = NSPredicate(format: "id == %d", id)
            fetchReq.predicate = myPredicate
         let teams =   try context.fetch(fetchReq)
            for team in teams
            {
                context.delete(team)
                self.saveContext()
    
            }
            
        }catch let error as NSError
        {
            print(error.localizedDescription)
        }
    }
    
   
    
  
}

      
