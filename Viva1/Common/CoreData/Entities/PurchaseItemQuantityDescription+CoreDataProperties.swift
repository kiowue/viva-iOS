//
//  PurchaseItemQuantityDescription+CoreDataProperties.swift
//  Viva1
//
//  Created by vishwender on 8/30/18.
//  Copyright © 2018 viva. All rights reserved.
//
//

import Foundation
import CoreData


extension PurchaseItemQuantityDescription {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PurchaseItemQuantityDescription> {
        return NSFetchRequest<PurchaseItemQuantityDescription>(entityName: "PurchaseItemQuantityDescription")
    }

    @NSManaged public var quantity: Float
    @NSManaged public var unit: String?
    @NSManaged public var mrp: Float
    @NSManaged public var priceAfterDiscount: Float
    @NSManaged public var purchaseItem: PurchaseItem?

}
