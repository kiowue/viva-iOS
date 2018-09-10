//
//  PurchaseItemType.swift
//  Viva1
//
//  Created by vishwender on 8/20/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation

struct ItemQuantityDescription {
    var quantity: Float
    var unit: String
    var mrp: Float
    var priceAfterDiscount: Float?
}

struct PurchaseItemType {
    
    struct Constants {
        static let maxSelectCountLimit = 99
    }
    
    var itemId: String
    var name: String
    var brandName: String
    let type: ObjectType = .item
    var image: String?
    var quantityDescriptionArray: [ItemQuantityDescription]?
    var quantityDescriptionSelectedIndex: Int16 = 0
    var quantitySelected: Int16 = 0
    init(itemId: String, name: String, brandName: String, image: String?, quantityDescriptionArray: [ItemQuantityDescription]?, quantityDescriptionSelectedIndex: Int16?, quantitySelected: Int16 = 0) {
        self.itemId = itemId
        self.name = name
        self.brandName = brandName
        self.image = image
        self.quantityDescriptionArray = quantityDescriptionArray
        if let index = quantityDescriptionSelectedIndex, let qArr = quantityDescriptionArray, qArr.count > index {
            self.quantityDescriptionSelectedIndex = index
        }
        self.quantitySelected = quantitySelected
    }
}

struct PurchaseItemDataParser: ModelParserProtocol {
    
    //MARK:- Parser to PurchaseItemType
    static func parseAndGetItems(array: [Any]) -> [PurchaseItemType]? {
        guard let array = array as? [[String: Any]] else {return nil}
        var purchaseItems: [PurchaseItemType]?
        for item in array {
            let purchaseItem: PurchaseItemType
            if let itemId = item["id"] as? String,
                let name = item["name"] as? String,
                let brandName = item["brandName"] as? String {
                
                /************************************************/
                let image = item["image"] as? String
                var q : Int16 = 0
                if let qStr = item["quantityDescriptionSelectedIndex"] as? String {
                    q = Int16(qStr) ?? 0
                }
                purchaseItem = PurchaseItemType(itemId: itemId, name: name, brandName: brandName, image: image, quantityDescriptionArray: parseItemQunatityDescription(fromData: item["itemQuantityDescription"] as? [[String: Any]]), quantityDescriptionSelectedIndex: q)
                if purchaseItems == nil {
                    purchaseItems = [PurchaseItemType]()
                }
                purchaseItems?.append(purchaseItem)
                /************************************************/
            } else {
                //
            }
        }
        return purchaseItems
    }
    
    private static func parseItemQunatityDescription(fromData array: [[String: Any]]?) -> [ItemQuantityDescription]? {
        guard let array = array else {return nil}
        var itemQuantityDescriptionArray: [ItemQuantityDescription]?
        for item in array {
            if let quantityString = item["quantity"] as? String, let quantity = Float(quantityString), let unit = item["unit"] as? String, let mrpString = item["mrp"] as? String, let mrp = Float(mrpString) {
                var priceAfterDiscount: Float?
                if let priceAfterDiscountString = item["priceAfterDiscount"] as? String {
                    priceAfterDiscount = Float(priceAfterDiscountString)
                }
                let tItem = ItemQuantityDescription(quantity: quantity, unit: unit, mrp: mrp, priceAfterDiscount: priceAfterDiscount)
                
                if itemQuantityDescriptionArray == nil {
                    itemQuantityDescriptionArray = [ItemQuantityDescription]()
                }
                itemQuantityDescriptionArray?.append(tItem)
            }
        }
        return itemQuantityDescriptionArray
    }
    
    //MARK:- CoreData entity to PurchaseItemType
    static func parseAndGetItems(modules: [PurchaseItem]) -> [PurchaseItemType]? {
        var purchaseItems = [PurchaseItemType]()
        
        for module in modules {
            if let itemId = module.itemId, let name = module.name, let brandName = module.brandName {
                let purchaseItemType = PurchaseItemType(itemId: itemId, name: name, brandName: brandName, image: module.image, quantityDescriptionArray: parseItemQunatityDescription(fromQuantityDescriptionArray: module.quantityDescriptionArray?.array as? [PurchaseItemQuantityDescription]), quantityDescriptionSelectedIndex: module.quantityDescriptionSelectedIndex, quantitySelected: module.quantitySelected)
                
                purchaseItems.append(purchaseItemType)
            }
        }
        
        if purchaseItems.count > 0 {
            return purchaseItems
        }
        return nil
    }
    
    private static func parseItemQunatityDescription(fromQuantityDescriptionArray array: [PurchaseItemQuantityDescription]?) -> [ItemQuantityDescription]? {
        guard let array = array else {return nil}
        var itemQuantityDescriptionArray: [ItemQuantityDescription]?
        for item in array {
            if let unit = item.unit {
                let quantity = item.quantity
                let mrp = item.mrp
                let priceAfterDiscount = item.priceAfterDiscount
                
                let tItem = ItemQuantityDescription(quantity: quantity, unit: unit, mrp: mrp, priceAfterDiscount: priceAfterDiscount)
                
                if itemQuantityDescriptionArray == nil {
                    itemQuantityDescriptionArray = [ItemQuantityDescription]()
                }
                itemQuantityDescriptionArray?.append(tItem)
            }
        }
        return itemQuantityDescriptionArray
    }
}

struct PurchaseItemDataResource: ApiResource {
    var url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    typealias Model = PurchaseItemType
    
    func makeModelFrom(jsonArray: [Any]) -> [PurchaseItemType]? {
        return PurchaseItemDataParser.parseAndGetItems(array: jsonArray)
    }
}
