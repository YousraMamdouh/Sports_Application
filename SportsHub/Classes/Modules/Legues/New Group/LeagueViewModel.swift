//
//  LeagueViewModel.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 28/05/2023.
//

import UIKit


class LeagueViewModel: NSObject {
    var observable: Observable<Bool> = Observable(false)
    
    var leaguesArray: [FootballLeague] = []
    var filteredLeaguesArray : [FootballLeague] = []
 

  //  var filteredLeaguesArray = [FootballLeague]()
  //  let filteredLeaguesSubject = BehaviorSubject<[FootballLeague]>(value: [])
    // MARK: - getLeagues
    func getLeagues(param:String)
    {
        self.observable.value = false
        
        APICaller.getLeagues(param: param) {
            result in
            self.leaguesArray = result?.result ?? []
            self.filteredLeaguesArray = self.leaguesArray
            self.observable.value = true
           // complitionHandler()
        }
    }
    func getLeaguesArrayCount()-> Int{
       filteredLeaguesArray.count
    }
    
    func getLeague(index:Int)-> FootballLeague
    {
       filteredLeaguesArray[index]
    }
    func getLeaagueKey(index:Int)-> Int
    {
        filteredLeaguesArray[index].league_key ?? 0
    }
    func getFilteredArray()-> [FootballLeague]
    {
        filteredLeaguesArray
    }
    
//    func filterLeagues(searchText: String) {
//        if searchText.isEmpty {
//            filteredLeaguesArray = leaguesArray
//        } else {
//            filteredLeaguesArray = leaguesArray.filter({ (league) -> Bool in
//                guard let leagueName = league.league_name?.lowercased() else { return false }
//                return leagueName.contains(searchText.lowercased())
//            })
//        }
//        filteredLeaguesSubject.onNext(filteredLeaguesArray)
//    }
    
    func filterLeagues(searchText: String) -> [FootballLeague] {
           if searchText.isEmpty {
               return leaguesArray
           } else {
               return leaguesArray.filter({ (league) -> Bool in
                   guard let leagueName = league.league_name?.lowercased() else { return false }
                   return leagueName.contains(searchText.lowercased())
               })
           }
       }



}
