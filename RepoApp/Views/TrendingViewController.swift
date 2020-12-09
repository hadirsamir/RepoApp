//
//  TrendingViewController.swift
//  RepoApp
//
//  Created by Mac on 12/8/20.
//

import UIKit
//View Protcole
protocol RepoViewProtcol {
    func viewRepos(object:RepoBaseResponseModel)
    func viewError(errorString : String)
}
class TrendingViewController: UIViewController {
    //MARK:- OUTLETS
    @IBOutlet weak var trendingTableView : UITableView!
    //MARK:- PROPERTIES
    var interactor : RepoInteractor!
    var presenter : RepoPresenter!
    //array to store objects of ItemsResponseModel
    var itemsArray : [ItemsResponseModel] = []
    //pageNumber value for pagination
    var pageNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trendingTableView.delegate = self
        trendingTableView.dataSource = self
        initProperties()
        //start indicator
        SpinnerIndicator.startIndicator(view: self)
        //call service function  in interactor to get Repos
        self.interactor.getRepoData(pageNo: pageNumber)
    }
    //initialize presenter&interactor
    func initProperties(){
        self.interactor = RepoInteractor()
        self.presenter = RepoPresenter()
        interactor.presenter = presenter
        presenter.view = self
        
    }


}
extension TrendingViewController: UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell", for: indexPath) as! RepoTableViewCell
        cell.configCell(object: itemsArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? RepoTableViewCell else{return}
        self.presentSafariVC(url:cell.repoUrl!)
      
    }
   //Function for pagination
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView == self.trendingTableView {
            if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height){
                self.pageNumber += 1
                SpinnerIndicator.startIndicator(view: self)
                self.interactor.getRepoData(pageNo: pageNumber)
            }
        }
        
    }
    
}
// implementing RepoViewProtcole
extension TrendingViewController : RepoViewProtcol {
    
    func viewRepos(object: RepoBaseResponseModel) {
     
        self.itemsArray = object.items
        DispatchQueue.main.async {
            self.trendingTableView.reloadData()
        }
        DispatchQueue.main.sync {
            SpinnerIndicator.stopIndicator()
        }
        
    }
    // func show alert if error is found
    func viewError(errorString: String) {
        SpinnerIndicator.stopIndicator()
        print(errorString)
    }
    
    
}
