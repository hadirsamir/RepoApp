//
//  SearchViewController.swift
//  RepoApp
//
//  Created by Mac on 12/8/20.
//

import UIKit
protocol SearchViewProtcol {
    func viewSearchResults(object: RepoBaseResponseModel )
    func viewSearchError(stringError : String)
}

class SearchViewController: UIViewController {
    @IBOutlet weak var searchTableView : UITableView!
    @IBOutlet weak var searchTextField : RoundedCornerTextField!
    var filteredItemsArray :[ItemsResponseModel] = []
    var itemsDataArray : [ItemsResponseModel] = []
    //MARK:- PROPERTIES
    var interactor : SearchInteractor!
    var presenter : SearchPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       initProperties()
        SpinnerIndicator.startIndicator(view: self)
        self.interactor.getRepos()
    }
    func initProperties(){
        self.interactor = SearchInteractor()
        self.presenter = SearchPresenter()
        interactor.presenter = presenter
        presenter.view = self
        
    }

   

}
extension SearchViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        return cell
    }
    
    
}

extension SearchViewController : UITextFieldDelegate{
    
}

extension SearchViewController : SearchViewProtcol {
    func viewSearchResults(object: RepoBaseResponseModel) {
        
    }
    
    func viewSearchError(stringError: String) {
        
    }
    
    
}
