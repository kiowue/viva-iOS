//
//  ItemCategoriesViewPresenter.swift
//  Viva1
//
//  Created by vishwender on 8/20/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit

class ItemCategoriesViewPresenter: ViewPresenter {
    
    override init(view: ViewControllerProtocol) {
        super.init(view: view)
        self.wireFrame = ItemCategoriesViewInterface()
        self.interactor = ItemCategoriesViewInteractor(presenter: self, url: URL(string: VivaApi.itemCategories)!)
    }
    
    override func showPostDetail<T>(forPost post: T) {
        if let view = self.view as? UIViewController  {
            wireFrame?.presentDetailScreen(from: view, forPost: post)
        }
    }
}

extension ItemCategoriesViewPresenter: ViewInteractorOutputProtocol {
    func didRetrievePosts<T>(_ posts: [T]) {
        tempContentOrderedSet = NSMutableOrderedSet(array: posts)
        view?.showPosts(with: posts)
    }
    
    func errorOccured(error: Error?) {
        //
    }
}
