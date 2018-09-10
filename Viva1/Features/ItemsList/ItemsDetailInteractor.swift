//
//  ItemsDetailInteractor.swift
//  Viva1
//
//  Created by vishwender on 9/5/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation

class ItemsDetailInteractor: ViewInteractor<PurchaseItemDataResource> {
    
    //MARK: - NetworkDataManagerOutputProtocol
    override func decode(_ data: Data?) {
        if let data = data {
            let response = resource.makeModelFrom(data: data)
            if let item = response.successResult() {
                DispatchQueue.main.async { [weak self] ()->Void in
                    self?.presenter?.didRetrievePosts([item])
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
