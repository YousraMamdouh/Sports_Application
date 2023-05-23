//
//  LeaguesDetailsViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 23/05/2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class test: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(UINib(nibName: "LatestResultCell", bundle: nil), forCellWithReuseIdentifier: "middleCell")
        collectionView.register(UINib(nibName: "UpComingEventsCell", bundle: nil), forCellWithReuseIdentifier: "upperCell")
        let layout = UICollectionViewCompositionalLayout()
        {
            index,enviroment in
            
            switch index {
                        case 0 :
                return self.drawTopSection()
                        case 1 :
                return self.drawMiddleSection()
                        default:
                return self.drawMiddleSection()
                        }
           
        }
        collectionView.setCollectionViewLayout(layout, animated: true)

        // Do any additional setup after loading the view.
    }
    
    func drawMiddleSection()->NSCollectionLayoutSection
    {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(200)
                                              , heightDimension: .absolute(200))
          let item = NSCollectionLayoutItem(layoutSize: itemSize)
          
          let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(250)
          , heightDimension: .absolute(250))
          let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize
          , subitems: [item])
              group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0
              , bottom: 0, trailing: 15)
              
          let section = NSCollectionLayoutSection(group: group)
              section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15
              , bottom: 10, trailing: 0)
            
              
             return section
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let width = collectionView.frame.width / 2 - 10
//            let height = width * 1.5
//            return CGSize(width: width, height: height)
//        }
    

    func drawTopSection()-> NSCollectionLayoutSection
    {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                              , heightDimension: .fractionalHeight(1))
          let item = NSCollectionLayoutItem(layoutSize: itemSize)
          
          let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
          , heightDimension: .fractionalHeight(1))
          let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize
          , subitems: [item])
              group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 10
              , bottom: 15, trailing: 10)
              
          let section = NSCollectionLayoutSection(group: group)
              section.contentInsets = NSDirectionalEdgeInsets(top:100, leading: 10
              , bottom: 15, trailing: 10)
              section.orthogonalScrollingBehavior = .continuous
              
             return section
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch(section)
        {
        case 0 :
            return 5
        case 1:
            return 5
        default:
            return 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        let upperCell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                "upperCell", for: indexPath) as! UpComingEventsCell
//        let middleCell = collectionView.dequeueReusableCell(withReuseIdentifier:
//                                                "middleCell", for: indexPath) as! LatestResultCell
    
        switch indexPath.section{
        case 0:
            return upperCell
//        case 1:
//            return middleCell
        default:
            return upperCell
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
