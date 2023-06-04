//
//  Alerts.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 25/05/2023.
//

import UIKit

class Alerts {
    static func makeConfirmationDialogue(message: String) {
        let alertController = UIAlertController(title: "Confirmation", message: message, preferredStyle: .alert)
        
   
        let confirmAction = UIAlertAction(title: "OK", style: .default) { _ in
      
        }
        
        alertController.addAction(confirmAction)
        
        if let topController = UIApplication.shared.keyWindow?.rootViewController {
            topController.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    static func makeComfirmationDeletionDialogue()
    {
        let alertController = UIAlertController(title: "Confirmation", message:"Are you sure you want to delete this item?", preferredStyle: .alert)
        
   
        let confirmAction = UIAlertAction(title: "Yes", style: .default) { _ in
      
        }
        let cancelationAction = UIAlertAction(title: "No", style: .default) { _ in
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelationAction)
            
        
        if let topController = UIApplication.shared.keyWindow?.rootViewController {
            topController.present(alertController, animated: true, completion: nil)
        }
    }
}
