//
//  SearchViewController.swift
//  RepoApp
//
//  Created by Mac on 12/8/20.
//

import UIKit
// search view protcol
protocol SearchViewProtcol {
    func viewSearchResults(object: RepoBaseResponseModel )
    func viewSearchError(stringError : String)
}

class SearchViewController: UIViewController {
    @IBOutlet weak var searchTableView : UITableView!
    @IBOutlet weak var searchTextField : UISearchBar!
    var filteredItemsArray :[ItemsResponseModel] = []
    var itemsDataArray : [ItemsResponseModel] = []
    var filtered : Bool = false
    //MARK:- PROPERTIES
    var interactor : SearchInteractor!
    var presenter : SearchPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.delegate = self
        searchTableView.dataSource = self
       initProperties()
        self.interactor.getRepos()
    }
    func initProperties(){
        self.interactor = SearchInteractor()
        self.presenter = SearchPresenter()
        interactor.presenter = presenter
        presenter.view = self
        searchTextField.delegate = self
        
    }

   

}
extension SearchViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered ? filteredItemsArray.count :  0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        if !filteredItemsArray.isEmpty{
            cell.configCell(object: filteredItemsArray[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SearchTableViewCell else{return}
        self.presentSafariVC(url:cell.repoUrl!)
      
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
   
    
}
//Search bar delegates
extension SearchViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterText(queryString: searchText)
    }
    
    
    
   
    func filterText(queryString : String){
        filteredItemsArray.removeAll()
       
       filteredItemsArray = itemsDataArray.filter {
         return  $0.name.lowercased().contains(queryString.lowercased())
       
        }
        self.searchTableView.reloadData()
        filtered = true
        
    }
    
    
    
    
}
// service get response
extension SearchViewController : SearchViewProtcol {
    func viewSearchResults(object: RepoBaseResponseModel) {
        self.itemsDataArray = object.items
    }
    
    func viewSearchError(stringError: String) {
        // show error
        AlertView.showAlert(view: self, title: "", message: "Sorry,Can't get data !")
    }
    
    
}
