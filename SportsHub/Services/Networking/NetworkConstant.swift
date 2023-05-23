//
//  ApiService.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 22/05/2023.
//

import UIKit

class NetworkConstant {

    public static var shared = NetworkConstant()
    
   private init() {
        
    }
    public var apiKey: String
    {
        get{
            return "c9a13732377d308c4f8293321d1834a5901ba3166630bbf70bf11313e0b1d05f"
        }
    }
    public var serverAddress: String
    {
        get{
            return "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey"
        }
    }
    
    func getTheServerAddress(param:String)->String
    {
        return "https://apiv2.allsportsapi.com/\(param)/?met=Leagues&APIkey"
    }
    
}
