//
//  CartInteractor.swift
//  Viva1
//
//  Created by vishwender on 8/25/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit

class CartInteractor<Resource: ManagedObjectResourceType>: ViewInteractorInputProtocol, NetworkDataManagerOutputProtocol {
    weak var presenter: ViewInteractorOutputProtocol?
    var localDatamanager: ManagedObjectDataManagerInputProtocol?
    var remoteDatamanager: NetworkDataManagerInputProtocol?
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.newBackgroundContext()
    
    var resource : Resource
    
    init(presenter: ViewInteractorOutputProtocol, url: URL) {
        self.presenter = presenter
        self.resource = Resource()
        self.localDatamanager = CoreDataTask<PurchaseItem, PurchaseItemType>()
    }
    
    func getUIContent() {
        // fetch DB content
        
        do {
            try localDatamanager?.fetchData(context: context)
        } catch {
            print(error)
        }
    }
}

extension CartInteractor {
    func decode(_ data: Data?) {
    }
}

extension CartInteractor: ManagedObjectDataManagerOutPutProtocol {
    func fetchedData<T>(items: [T]?) {
        if let fetchedItems = items {
            DispatchQueue.main.async { [weak self] ()->Void in
                self?.presenter?.didRetrievePosts(fetchedItems)
            }
        } else {
            DispatchQueue.main.async { [weak self] ()->Void in
                self?.presenter?.errorOccured(error: nil)
            }
        }
    }
    
    func fetchFailed() {
        presenter?.errorOccured(error: nil)
    }
    
    
}
