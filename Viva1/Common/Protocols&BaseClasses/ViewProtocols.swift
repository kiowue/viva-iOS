//
//  ViewProtocols.swift
//  Viva1
//
//  Created by vishwender on 1/28/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol ViewPresenterProtocol: class {
    var view: ViewControllerProtocol? { get set }
    var interactor: ViewInteractorInputProtocol? { get set }
    var wireFrame: ViewInterfaceProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showPostDetail<T>(forPost post: T)
}

protocol ViewControllerProtocol: class {
    var presenter: ViewPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showPosts<T>(with posts: [T])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

protocol ViewInteractorInputProtocol: class {
    var presenter: ViewInteractorOutputProtocol? { get set }
    var localDatamanager: ManagedObjectDataManagerInputProtocol? { get set }
    var remoteDatamanager: NetworkDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func getUIContent()
}

protocol ViewInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrievePosts<T>(_ posts: [T])
    func addPosts<T>(_ posts: [T])
    func errorOccured(error: Error?)
}

extension ViewInteractorOutputProtocol {
    func addPosts<T>(_ posts: [T]) {
        
    }
}

protocol ViewInterfaceProtocol: class {
    // PRESENTER -> INTERFACE
    func presentDetailScreen<T>(from view: UIViewController, forPost post: T)
}

protocol ManagedObjectDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    var dataManagerOutPutProtocol: ManagedObjectDataManagerOutPutProtocol? {get set}
    func fetchData(context: NSManagedObjectContext) throws
    func saveData(resource: ManagedObjectResourceType, inContext context: NSManagedObjectContext) throws
}

extension ManagedObjectDataManagerInputProtocol {
    func fetchData(context: NSManagedObjectContext) throws { }
    func saveData(resource: ManagedObjectResourceType, inContext context: NSManagedObjectContext) throws { }
}

protocol ManagedObjectDataManagerOutPutProtocol {
    func fetchedData<T>(items: [T]?)
    func fetchFailed()
}
