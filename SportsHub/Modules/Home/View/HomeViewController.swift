//
//  ViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 20/05/2023.
//

import UIKit
import Lottie

class HomeViewController: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource {
//    let football = SportDTO(name: "Football", image: "football.jpg")
//    let basketball = SportDTO(name: "Basketball", image: "basketball.png")
//    let cricket = SportDTO(name: "Cricket", image: "cricket.png")
//    let tennis = SportDTO(name: "Tennis", image: "tennis.png")
    
    let arrayOfSports : [SportDTO] = [SportDTO(name: "Football", image: "Football"),SportDTO(name: "Basketball", image: "Basketball"),SportDTO(name: "Cricket", image: "Cricket"),SportDTO(name: "Tennis", image: "Tennis")]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfSports.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sportCollectionViewCellId, for: indexPath) as! SportCollectionViewCell
        cell.sportLabel.text = arrayOfSports[indexPath.row].name
        cell.sportImage.image = UIImage(named: arrayOfSports[indexPath.row].image ?? "")
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

    @IBOutlet weak var sportsCollectionView: UICollectionView!
    let sportCollectionViewCellId = "SportCollectionViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let nibCell = UINib(nibName: sportCollectionViewCellId, bundle: nil)
        sportsCollectionView.register(nibCell, forCellWithReuseIdentifier: sportCollectionViewCellId)
        
       // self.navigationItem.rightBarButtonItem?.isHidden = true 
//        animation.contentMode = .scaleAspectFit
//        animation.loopMode = .loop
//        animation.play()
        
        sportsCollectionView.delegate = self
        sportsCollectionView.dataSource = self
        sportsCollectionView.reloadData()
        
        
        
    }

    enum Sport:String{
        case football = "football"
        case basketball = "basketball"
        case cricket = "cricket"
        case tennis = "tennis"
    }
    
}

