//
//  PurchaseItem+CoreDataProperties.swift
//  Viva1
//
//  Created by vishwender on 8/30/18.
//  Copyright © 2018 viva. All rights reserved.
//
//

import Foundation
import CoreData


extension PurchaseItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PurchaseItem> {
        return NSFetchRequest<PurchaseItem>(entityName: "PurchaseItem")
    }

    @NSManaged public var itemId: String?
    @NSManaged public var name: String?
    @NSManaged public var brandName: String?
    @NSManaged public var image: String?
    @NSManaged public var type: String?
    @NSManaged public var quantityDescriptionSelectedIndex: Int16
    @NSManaged public var quantitySelected: Int16
    @NSManaged public var quantityDescriptionArray: NSOrderedSet?

}

// MARK: Generated accessors for quantityDescriptionArray
extension PurchaseItem {

    @objc(insertObject:inQuantityDescriptionArrayAtIndex:)
    @NSManaged public func insertIntoQuantityDescriptionArray(_ value: PurchaseItemQuantityDescription, at idx: Int)

    @objc(removeObjectFromQuantityDescriptionArrayAtIndex:)
    @NSManaged public func removeFromQuantityDescriptionArray(at idx: Int)

    @objc(insertQuantityDescriptionArray:atIndexes:)
    @NSManaged public func insertIntoQuantityDescriptionArray(_ values: [PurchaseItemQuantityDescription], at indexes: NSIndexSet)

    @objc(removeQuantityDescriptionArrayAtIndexes:)
    @NSManaged public func removeFromQuantityDescriptionArray(at indexes: NSIndexSet)

    @objc(replaceObjectInQuantityDescriptionArrayAtIndex:withObject:)
    @NSManaged public func replaceQuantityDescriptionArray(at idx: Int, with value: PurchaseItemQuantityDescription)

    @objc(replaceQuantityDescriptionArrayAtIndexes:withQuantityDescriptionArray:)
    @NSManaged public func replaceQuantityDescriptionArray(at indexes: NSIndexSet, with values: [PurchaseItemQuantityDescription])

    @objc(addQuantityDescriptionArrayObject:)
    @NSManaged public func addToQuantityDescriptionArray(_ value: PurchaseItemQuantityDescription)

    @objc(removeQuantityDescriptionArrayObject:)
    @NSManaged public func removeFromQuantityDescriptionArray(_ value: PurchaseItemQuantityDescription)

    @objc(addQuantityDescriptionArray:)
    @NSManaged public func addToQuantityDescriptionArray(_ values: NSOrderedSet)

    @objc(removeQuantityDescriptionArray:)
    @NSManaged public func removeFromQuantityDescriptionArray(_ values: NSOrderedSet)

}
