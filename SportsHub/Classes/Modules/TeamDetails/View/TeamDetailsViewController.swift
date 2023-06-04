//
//  TeamsViewModel.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 25/05/2023.
//

import UIKit

class TeamDetailsViewController:UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var addToFavoritesBtn: UIButton!
    @IBAction func addToFavoritesButton(_ sender: UIButton)
    
    {
        
       viewModel.insertTeamInDatabase(name: teamName.text ?? " ", id: teamId ?? 0)
    }
    
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    
    @IBOutlet weak var coach: UILabel!
    
    let indicator = Indicator()
    
    let viewModel = TeamDetailsViewModel()
    let favoritesViewModel = FavoritesViewModel()
    //var teamDetailsArray:TeamDetails?
    //var teamPlayers:[Player]?

    
    var teamId:Int?
    override func viewDidLoad() {
        addToFavoritesBtn.isHidden = true
        setupCollectionView()
        bindingViewModel()
        indicator.setUpNetworkIndicator(view: view)
        indicator.startIndicator()
      
    }
    
    func setupCollectionView()
    {
        collectionView.register(UINib(nibName: "PlayerCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    func bindingViewModel()
    {
        viewModel.observable.bind {
            [weak self]
            result in
            guard let self = self ,  let isLoading = result
                    else
            {
                return
            }

            DispatchQueue.main.async {
                if isLoading                 {
                    self.collectionView.reloadData()
    
                    self.indicator.stopIndicator()
                    self.addToFavoritesBtn.isHidden  = false
                }
            }

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getFootballTeamDetails(teamId: teamId!)
        {
          let team =   self.viewModel.getTeam()
         
            DispatchQueue.main.async {
                self.teamName.text = team.team_name
               self.teamImage.sd_setImage(with: URL(string: team.team_logo ?? "" ),placeholderImage: UIImage(named: "Player.jpg"))
                
               self.coach.text = team.coaches?[0].coach_name

                //self.addToFavoritesBtn.isHidden = false
            }
        }
    }
    
    
  
}
extension TeamDetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getPlayersCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PlayerCell
        cell.configureCell(player: viewModel.getPlayer(index: indexPath.row))
        
        return cell
    }

 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        return CGSize(width: collectionView.frame.size.width/2 - collectionView.frame.size.width*0.04, height:collectionView.frame.size.height/2)
}
    
}
