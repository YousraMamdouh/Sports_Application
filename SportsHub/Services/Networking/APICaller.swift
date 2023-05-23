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
        let urlString:String = NetworkConstant.shared.getTheServerAddress(param: param)+"="+NetworkConstant.shared.apiKey
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
                          print(result.result?[3].league_name ?? "No Title")
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
