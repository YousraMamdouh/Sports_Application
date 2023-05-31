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
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(changeVc),userInfo: nil,repeats: false)
        // Do any additional setup after loading the view.
    }
    
    @objc func changeVc()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        vC.modalPresentationStyle = .fullScreen
        self.present(vC,animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
