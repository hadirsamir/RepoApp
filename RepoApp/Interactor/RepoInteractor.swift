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
        NetworkService.sharedInstance.getDataFromNetwork(urlString: BASE_URL + String(pageNo) + NUMBER_OF_ITEMS) { (object : RepoBaseResponseModel) in
            self.presenter.presentRepoData(object: object)
            print(object.items.count)
        } onError: { (error) in
            print(error.localizedDescription)
            self.presenter.presentError(errorString: error.localizedDescription)
        }

    }
}
