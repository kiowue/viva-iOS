//
//  CategoriesDataModel.swift
//  Viva1
//
//  Created by vishwender on 8/20/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation

enum ObjectType: String {
    case categoryBasic
    case categoryDetail
    case item
}

protocol ModelParserProtocol {
    associatedtype Model
    static func parseAndGetItems(array: [Any]) -> [Model]?
}

struct CategoriesDataModel {
    var itemId: String
    var name: String
    var type: ObjectType = .categoryBasic
    var image: String?
    init(itemId: String, name: String, image: String?) {
        self.itemId = itemId
        self.name = name
        self.image = image
    }
}

struct CategoriesDataParser: ModelParserProtocol {
    static func parseAndGetItems(array: [Any]) -> [CategoriesDataModel]? {
        guard let array = array as? [[String: Any]] else {return nil}
        var categories: [CategoriesDataModel]?
        for item in array {
            let category: CategoriesDataModel
            if let itemId = item["id"] as? String,
                let name = item["name"] as? String {
                
                /************************************************/
                let image = item["image"] as? String
                category = CategoriesDataModel(itemId: itemId, name: name, image: image)
                if categories == nil {
                    categories = [CategoriesDataModel]()
                }
                categories?.append(category)
                /************************************************/
            } else {
                //
            }
        }
        return categories
    }
}

struct CategoriesDataResource: ApiResource {
    typealias Model = [CategoriesDataModel]
    var url : URL
    
    init(url: URL) {
        self.url = url
    }
    
    public func makeModelFrom(jsonDictionary: [String: Any]) -> Model? {
        if let items = jsonDictionary["items"] as? [Any] {
            return CategoriesDataParser.parseAndGetItems(array: items)
        }
        return nil
    }
}
