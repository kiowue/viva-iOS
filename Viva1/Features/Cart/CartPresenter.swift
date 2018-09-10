//
//  CartPresenter.swift
//  Viva1
//
//  Created by vishwender on 8/25/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation

class CartPresenter: ViewPresenter {
    override init(view: ViewControllerProtocol) {
        super.init(view: view)
        self.interactor = ItemCategoriesViewInteractor(presenter: self, url: URL(string: VivaApi.verifyCartContent)!)
    }
    
    override func showPostDetail<T>(forPost post: T) {
        //
    }
}

extension CartPresenter: ViewInteractorOutputProtocol {
    func didRetrievePosts<T>(_ posts: [T]) {
        view?.showPosts(with: posts)
    }
    
    func errorOccured(error: Error?) {
        //
    }
}
