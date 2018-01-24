//
//  ApiResources.swift
//  Viva1
//
//  Created by vishwender on 11/20/17.
//  Copyright © 2017 viva. All rights reserved.
//

import Foundation

struct ApiWrapper {
    let items: [Serialization]
}

extension ApiWrapper {
    private enum Keys: String, SerializationKey {
        case items
    }
    
    init(serialization: Serialization) {
        items = serialization.value(forKey: Keys.items) ?? []
    }
}

protocol ApiResource: NetworkJSONResourceType {
    
}
