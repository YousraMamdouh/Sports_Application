//
//  SplashScreenViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 30/05/2023.
//

import UIKit
import Lottie

class SplashScreenViewController: UIViewController {
   

    @IBOutlet weak var animationView: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        animationView.isHidden = false
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        let example = "https://4a798eacca0d39cc2048369ad2025b47:shpat_df5dd0b91df587be08c73286fa 6e0267@mad-sv.myshopify.com/admin/api/2022-01/collects.json"
        let nono = "https://{apikey}:{password}@{hostname}/admin/api/{version}/{resource}.json"
      //  let url = "https://3ec4212c45d4957fa3a49ab23d83ff1b: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@mad-sv.myshopify.com/admin/api//2022-01/collects.json"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.performSegue(withIdentifier: "navigateToHome", sender: nil)
        }
//        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(changeVc),userInfo: nil,repeats: false)
        // Add a delay of 2 seconds before transitioning to the navigation controller
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                self.transitionToMainContent()
//            }
        // Do any additional setup after loading the view.
    }
    

//   @objc func transitionToMainContent() {
//        // Instantiate the navigation controller and set it as the window's root view controller
//        let navigationController = UINavigationController(rootViewController:SplashScreenViewController())
//        UIApplication.shared.windows.first?.rootViewController = navigationController
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
