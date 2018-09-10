//
//  HomeViewPresenter.swift
//  Viva1
//
//  Created by vishwender on 1/27/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation

class HomeViewPresenter: ViewPresenter {
    
    override init(view: ViewControllerProtocol) {
        super.init(view: view)
        interactor = HomeViewInteractor(presenter: self, url: URL(string: VivaApi.homeContent)!)
    }
    
    override func showPostDetail<T>(forPost post: T) {
        //
    }
    
    
}

extension HomeViewPresenter: ViewInteractorOutputProtocol {
    func didRetrievePosts<T>(_ posts: [T]) {
        //
    }
    
    func errorOccured(error: Error?) {
        //
    } 
}
