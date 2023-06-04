//
//  HomeViewModel.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 03/06/2023.
//

import UIKit

class HomeViewModel{
    let arrayOfSports : [SportDTO] = [SportDTO(name: "Football", image: "Football"),SportDTO(name: "Basketball", image: "Basketball"),SportDTO(name: "Cricket", image: "Cricket"),SportDTO(name: "Tennis", image: "Tennis")]
    
    
    func getArrayCount()->Int
    {
        arrayOfSports.count
    }
    
    func getSport(index:Int)-> SportDTO
    {
        arrayOfSports[index]
    }
}
