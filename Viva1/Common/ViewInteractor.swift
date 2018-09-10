//
//  ViewInteractor.swift
//  Viva1
//
//  Created by vishwender on 8/25/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation

class ViewInteractor<Resource: ApiResource>: ViewInteractorInputProtocol, NetworkDataManagerOutputProtocol {
    weak var presenter: ViewInteractorOutputProtocol?
    var localDatamanager: ManagedObjectDataManagerInputProtocol?
    var remoteDatamanager: NetworkDataManagerInputProtocol?
    
    var resource : Resource
    
    init(presenter: ViewInteractorOutputProtocol, url: URL) {
        self.presenter = presenter
        self.resource = Resource(url: url)
        if let urlRequest = resource.urlRequest() {
            remoteDatamanager = ApiRequest(urlRequest: urlRequest, remoteRequestHandler: self)
        }
    }
    
    func getUIContent() {
        // fetch DB content
        
        // fetch N/W content
        remoteDatamanager?.fetchData()
    }
    
    // to be overridden in base class
    func decode(_ data: Data?) {
    }
}
