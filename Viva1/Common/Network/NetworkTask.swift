//
//  NetworkTask.swift
//  Viva1
//
//  Created by vishwender on 11/21/17.
//  Copyright © 2017 viva. All rights reserved.
//

import Foundation
import UIKit

public enum NetworkTaskError: Error {
    case CouldNotCreateURLRequest
    case StatusCodeError(statusCode: Int)
    case NetworkingError(error: NSError)
    case NoData
}

public class NetworkSession {
    let session: URLSession
    static let defaultSession = URLSession(configuration: .default)
    
    init() {
        self.session = NetworkSession.defaultSession
    }
    
    init(session: URLSession) {
        self.session = session
    }
    
    init(withSessionConfiguration: URLSessionConfiguration) {
        self.session = URLSession(configuration: withSessionConfiguration)
    }
}

protocol NetworkDataManagerInputProtocol {
    var remoteRequestHandler: NetworkDataManagerOutputProtocol? { get set }
    var parentSession: NetworkSession {get set}
    var urlRequest: URLRequest {get set}

    func fetchData()
}

extension NetworkDataManagerInputProtocol {
    // For now this method perform fetch with dataTask. Support for downloadTask and uploadTask
    // will be appended in future.
    fileprivate func fetch(_ urlRequest: URLRequest?) {
        guard let urlRequest = urlRequest else {
            self.remoteRequestHandler?.decode(nil)
            return
        }
        let task = parentSession.session.dataTask(with: urlRequest, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                self.remoteRequestHandler?.decode(nil)
                return
            }
            if error != nil {
                self.remoteRequestHandler?.decode(nil)
                return
            }
            self.remoteRequestHandler?.decode(data)
        })
        task.resume()
    }
}

protocol NetworkDataManagerOutputProtocol {
    func decode(_ data: Data?)
}

class ApiRequest: /*NetworkDataTask*/ NetworkDataManagerInputProtocol {
    var parentSession: NetworkSession
    var urlRequest: URLRequest

    var remoteRequestHandler: NetworkDataManagerOutputProtocol?

    init(urlRequest: URLRequest, session: NetworkSession, remoteRequestHandler: NetworkDataManagerOutputProtocol) {
        self.parentSession = session
        self.remoteRequestHandler = remoteRequestHandler
        self.urlRequest = urlRequest
    }
    
    init(urlRequest: URLRequest, remoteRequestHandler: NetworkDataManagerOutputProtocol) {
        self.parentSession = NetworkSession()
        self.remoteRequestHandler = remoteRequestHandler
        self.urlRequest = urlRequest
    }
    
    func fetchData() {
        fetch(self.urlRequest)
    }
}
