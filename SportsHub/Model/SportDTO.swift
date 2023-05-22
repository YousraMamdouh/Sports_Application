//
//  SportDTO.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 20/05/2023.
//

import Foundation
class SportDTO
{
    var name : String?
    var image : String?

    
  init(name:String, image:String)
    {
        self.image = image
        self.name = name
    }
}
