//
//  HomeDataModel.swift
//  Viva1
//
//  Created by vishwender on 1/28/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation

protocol HomeDataModelInputProtocol {
    func parseFeaturedData(serialization: Serialization)
    func parseUserContentData(serialization: Serialization)
}

struct HomeDataModel {
    var contentOrderedSet = NSMutableOrderedSet()
    
    //featured data, merge with static data
    //user data
    //ads
}

extension HomeDataModel {
    
    init(serialization: Serialization) {
    }
}

extension HomeDataModel {
    func parseFeaturedData(serialization: Serialization) {
        // construct Model objects
        // Reorder Model Objects
    }
    
    func parseUserContentData(serialization: Serialization) {
        
    }
}

struct HomeModelResource: ApiResource {
    typealias Model = HomeDataModel
    
    var url : URL
    
    init(url: URL) {
        self.url = url
    }
    
    //todo: make it compatible to home view content
    func makeModelFrom(jsonDictionary: [String : Any]) -> Model? {
        return HomeDataModel(serialization: jsonDictionary)
    }
}
