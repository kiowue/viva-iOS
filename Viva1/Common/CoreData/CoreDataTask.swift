//
//  CoreDataTask.swift
//  Viva1
//
//  Created by vishwender on 8/26/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import CoreData

class CoreDataTask<ManagedObjectType: NSManagedObject, ModelType: Any>: NSObject, ManagedObjectJSONResourceType, ManagedObjectDataManagerInputProtocol {
    
    typealias Model = ModelType
    
    var predicate: NSPredicate? = nil
    var sortDescriptors: [NSSortDescriptor]? = nil
    
    public required override init () {
        super.init()
    }
    
    private func fetch(inContext context: NSManagedObjectContext, completion: (_ fetchdObjects: [ManagedObjectType]?) -> Void) throws {
        let fetchRequest = ManagedObjectType.fetchRequest()
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors
        
        //        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        let objects = try context.fetch(fetchRequest)
        completion(objects as? [ManagedObjectType])
    }
    
    //MARK: - ManagedObjectDataManagerInputProtocol
    var dataManagerOutPutProtocol: ManagedObjectDataManagerOutPutProtocol?
    
    func fetchData(context: NSManagedObjectContext) throws {
        try fetch(inContext: context, completion: { (fetchedObjects: [ManagedObjectType]?) -> Void in
            guard let items = fetchedObjects else {
                dataManagerOutPutProtocol?.fetchFailed()
                return
            }
            var modelObjects = [Model]()
            for item in items {
                if let purchaseItem = makeModelFrom(coreDataItem: item) {
                    modelObjects.append(purchaseItem)
                }
            }
            if modelObjects.count > 0 {
                dataManagerOutPutProtocol?.fetchedData(items: modelObjects)
            } else {
                dataManagerOutPutProtocol?.fetchFailed()
            }
        })
    }
}
