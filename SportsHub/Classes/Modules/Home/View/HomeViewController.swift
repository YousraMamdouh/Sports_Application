//
//  ViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 20/05/2023.
//

import UIKit
import Lottie

class HomeViewController: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource {

    @IBOutlet weak var sportsCollectionView: UICollectionView!
    let sportCollectionViewCellId = "SportCollectionViewCell"
    let viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let nibCell = UINib(nibName: sportCollectionViewCellId, bundle: nil)
        sportsCollectionView.register(nibCell, forCellWithReuseIdentifier: sportCollectionViewCellId)
        
       // self.navigationItem.rightBarButtonItem?.isHidden = true
//        animation.contentMode = .scaleAspectFit
//        animation.loopMode = .loop
//        animation.play()
        self.title = "Home"
        sportsCollectionView.delegate = self
        sportsCollectionView.dataSource = self
        sportsCollectionView.reloadData()
        
        
        
    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getArrayCount()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sportCollectionViewCellId, for: indexPath) as! SportCollectionViewCell
        cell.configCell(sport: viewModel.getSport(index: indexPath.row))
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  
        switch(indexPath.row)
        {
        case 0:
        
            navigateToTheLeagues(str: Sport.football.rawValue)
        case 1:
      
            navigateToTheLeagues(str: Sport.basketball.rawValue)
        case 2:
          
            navigateToTheLeagues(str: Sport.cricket.rawValue)
        case 3:
            navigateToTheLeagues(str: Sport.tennis.rawValue)
     
        default:
          return
        }
    }
    
    
    func navigateToTheLeagues(str:String)
    {
        let vC = self.storyboard?.instantiateViewController(identifier: "LeaguesTableViewController") as! LeaguesTableViewController
        vC.gameName = str
          self.navigationController?.pushViewController(vC, animated: true)
        
        
    }

    

    enum Sport:String{
        case football = "football"
        case basketball = "basketball"
        case cricket = "cricket"
        case tennis = "tennis"
    }
    
}

