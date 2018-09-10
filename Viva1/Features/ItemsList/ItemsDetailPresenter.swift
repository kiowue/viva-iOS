//
//  ItemsDetailPresenter.swift
//  Viva1
//
//  Created by vishwender on 9/5/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation

class ItemsDetailPresenter: ViewPresenter {
    
    override init(view: ViewControllerProtocol) {
        super.init(view: view)
        interactor = ItemsDetailInteractor(presenter: self, url: URL(string: VivaApi.homeContent)!)
    }
}

extension ItemsDetailPresenter: ViewInteractorOutputProtocol {
    func didRetrievePosts<T>(_ posts: [T]) {
        tempContentOrderedSet = NSMutableOrderedSet(array: posts)
        view?.showPosts(with: posts)
    }
    
    func errorOccured(error: Error?) {
        view?.showError()
    }
}
