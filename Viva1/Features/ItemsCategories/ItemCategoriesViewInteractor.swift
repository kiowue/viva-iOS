//
//  ItemCategoriesViewInteractor.swift
//  Viva1
//
//  Created by vishwender on 8/20/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation

class ItemCategoriesViewInteractor: ViewInteractor<CategoriesDataResource> {

    //MARK:- ViewInteractorOutputProtocol
    override func decode(_ data: Data?) {
        if let data = data {
            let response = resource.makeModelFrom(data: data)
            if let items = response.successResult() {
                DispatchQueue.main.async { [weak self] ()->Void in
                    self?.presenter?.didRetrievePosts(items)
                }
            } else {
                let error = response.error()
                DispatchQueue.main.async { [weak self] ()->Void in
                    self?.presenter?.errorOccured(error: error)
                }
            }
        }
    }
}
