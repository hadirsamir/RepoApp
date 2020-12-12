//
//  RepoInteractor.swift
//  RepoApp
//
//  Created by Mac on 12/9/20.
//

import Foundation
protocol RepoInteractorProtcol {
    func getRepoData(pageNo : Int)
}

class RepoInteractor : RepoInteractorProtcol{
    var presenter : RepoPresenterProtcol!
    
    func getRepoData(pageNo: Int) {
        NetworkService.sharedInstance.getDataFromNetwork(urlString: BASE_URL + String(pageNo) + NUMBER_OF_ITEMS + STARS_DESC_SEGMENT) { (object : RepoBaseResponseModel) in
            self.presenter.presentRepoData(object: object)
            print(object.items.count)
        } onError: { (error) in
            print(error.localizedDescription)
            self.presenter.presentError(errorString: error.localizedDescription)
        }

    }
}
protocol SearchInteractorProtcole {
    func getRepos()
}
class SearchInteractor : SearchInteractorProtcole{
    var presenter : SearchPresenterProtcol?
    func getRepos() {
        NetworkService.sharedInstance.getDataFromNetwork(urlString: SEARCH_REPOS_URL) { (object : RepoBaseResponseModel) in
            self.presenter?.presentSearchRepos(object: object)
            print(object.items.count)
        } onError: { (error) in
            print(error.localizedDescription)
            self.presenter?.presentSearchError(stringError: error.localizedDescription)
        }
    }
    
    
}
