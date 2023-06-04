//
//  FootBallLeaguesTableViewController.swift
//  SportsHub
//
//  Created by Yousra Mamdouh Ali on 21/05/2023.
//

import UIKit
import SDWebImage
import Lottie
import Reachability



class LeaguesTableViewController: UIViewController{

    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    let reachability = try! Reachability()
    var viewModel = LeagueViewModel()
let indicator = Indicator()
    var gameName:String?

    override func viewDidLoad() {
        super.viewDidLoad()
 setupTableView()
       changeBackButtonColorToBlue(for: self)
        //  tableView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        indicator.setUpNetworkIndicator(view: view)
        bindingViewModel()
        indicator.startIndicator()
        getLeagues()
        searchBar.delegate = self
        try! reachability.startNotifier()
     
 
 
    }
    override func viewWillAppear(_ animated: Bool) {
        checkConnectivity()
    }
    func setupTableView()
    {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func showAnimation()
    {
        animationView.isHidden = false
        tableView.isHidden = true
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
    }
    func hideAnimation()
    {
        tableView.isHidden = false
        animationView.isHidden = true
        animationView.stop()
        
    }
    
    func checkConnectivity()
    {
        switch reachability.connection {
        case .wifi, .cellular:
            print("Internet connection is available.")
            hideAnimation()
     
        case .unavailable:
            print("Internet connection is unavailable.")
            showAnimation()

        case .none:
            print("no internet")
        }
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
                if isLoading
                {
                    self.tableView.reloadData()
                    self.indicator.stopIndicator()
                }
            }

        }
    }

func getLeagues()
    {
        if let param = gameName
        {
            viewModel.getLeagues(param: param)
            
        }
            else
            {
                print("error")
            }
    }


    
}




extension LeaguesTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filteredLeaguesArray = viewModel.filterLeagues(searchText: searchText)
        tableView.reloadData()
    }
    
}

extension LeaguesTableViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getLeaguesArrayCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
           cell.configureCell(league: viewModel.getLeague(index: indexPath.row))
    //        let league = filteredLeaguesArray[indexPath.row]
    //               cell.textLabel?.text = league.league_name
           return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vC = self.storyboard?.instantiateViewController(identifier: "LeaguesDetailsViewController") as! LeaguesDetailsViewController
            vC.leagueId = viewModel.getLeaagueKey(index: indexPath.row)
            vC.gameName = gameName
              self.navigationController?.pushViewController(vC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
    

    
   // func searchWithRXSwift()
   // {
        
        
        
        //                searchBar.rx.text.orEmpty
        //                       .debounce(.milliseconds(300), scheduler: MainScheduler())
        //                       .distinctUntilChanged()
        //                       .subscribe(onNext: { [weak self] searchText in
        //                           self?.viewModel.filterLeagues(searchText: searchText)
        //                       })
        //                       .disposed(by: disposeBag)
        //
        ////        viewModel.filterLeagues(searchText: searchBar.text ?? "")
        ////        tableView.reloadData()
        //                   viewModel.filteredLeaguesSubject
        //                       .bind(to: tableView.rx.items(cellIdentifier: "cell")) { _, league, cell in
        //                           cell.textLabel?.text = league.league_name
        //                       }
        //                       .disposed(by: disposeBag)
    //}
    

