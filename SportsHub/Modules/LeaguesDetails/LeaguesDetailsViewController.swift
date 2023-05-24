//
//  LeaguesViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 23/05/2023.
//

import UIKit

class LeaguesDetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        // Do any additional setup after loading the view.
       tableView.register(UINib(nibName: "LatestResultTableCell", bundle: nil), forCellReuseIdentifier: "middleCell")
        
        
        topCollectionView.register(UINib(nibName: "UpComingEventsCell", bundle: nil), forCellWithReuseIdentifier: "upperCell")
 
   
    }
    

 }
extension LeaguesDetailsViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let middleCell = tableView.dequeueReusableCell(withIdentifier:
                                                "middleCell", for: indexPath) as! LatestResultTableCell
        return middleCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 140
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 200
    }
 
}

extension LeaguesDetailsViewController:UICollectionViewDelegate,UICollectionViewDataSource
,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let upperCell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                "upperCell", for: indexPath) as! UpComingEventsCell
        return upperCell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
//    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
//        return CGSize(width: topCollectionView.frame.size.width, height: topCollectionView.frame.size.height)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: topCollectionView.frame.size.width, height: topCollectionView.frame.size.height)

    }
}
