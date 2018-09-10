//
//  HomeViewInteractor.swift
//  Viva1
//
//  Created by vishwender on 1/27/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation

class HomeViewInteractor: ViewInteractor<HomeModelResource> {
    
    //MARK: - NetworkDataManagerOutputProtocol
    override func decode(_ data: Data?) {
        if let data = data {
            let response = resource.makeModelFrom(data: data)
            if let item = response.successResult() {
                presenter?.didRetrievePosts([item])
            } else {
                let error = response.error()
                presenter?.errorOccured(error: error)
            }
        }
    }
}
