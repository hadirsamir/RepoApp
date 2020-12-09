//
//  RepoPresenter.swift
//  RepoApp
//
//  Created by Mac on 12/9/20.
//

import Foundation
protocol RepoPresenterProtcol {
    func presentRepoData(object:RepoBaseResponseModel )
    func presentError(errorString : String)
}
class RepoPresenter: RepoPresenterProtcol{
    var view : RepoViewProtcol?
    func presentRepoData(object: RepoBaseResponseModel) {
        self.view?.viewRepos(object: object)
    }
    
   
    
    func presentError(errorString: String) {
        self.presentError(errorString: errorString)
    }
}
