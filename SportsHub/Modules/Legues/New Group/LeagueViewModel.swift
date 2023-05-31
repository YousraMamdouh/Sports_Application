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
    // MARK: - getLeagues
    func getLeagues(param:String)
    {
        self.observable.value = false
        
        APICaller.getLeagues(param: param) {
            result in
            self.leaguesArray = result?.result ?? []
            self.observable.value = true
           // complitionHandler()
        }
    }
    func getLeaguesArrayCount()-> Int{
        leaguesArray.count
    }
    
    func getLeague(index:Int)-> FootballLeague
    {
        leaguesArray[index]
    }
    func getLeaagueKey(index:Int)-> Int
    {
        leaguesArray[index].league_key ?? 0
    }
}
