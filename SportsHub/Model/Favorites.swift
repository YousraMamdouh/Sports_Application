//
//  Favorites.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 29/05/2023.
//

import UIKit

class Favorites: NSObject {
    var name:String?
    var id:Int?
    
 init(name:String,id:Int) {
        self.name = name
        self.id = id
    }
}
