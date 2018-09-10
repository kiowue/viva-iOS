//
//  DBJSONResourceType.swift
//  Viva1
//
//  Created by vishwender on 8/28/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import CoreData

public protocol ManagedObjectResourceType {
    var predicate: NSPredicate? {get set}
    var sortDescriptors: [NSSortDescriptor]? {get set}
    
    init()
}

public protocol ManagedObjectJSONResourceType: ManagedObjectResourceType, JSONResourceType {
    
}
