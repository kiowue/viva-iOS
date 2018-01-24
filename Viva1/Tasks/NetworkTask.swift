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

public protocol NetworkTaskType {
    unowned var parentSession: NetworkSession {get}
}

public class NetworkSession {
    let session: URLSession
    let sessionConfiguration: URLSessionConfiguration = .default
    
    init() {
        self.session = URLSession()
    }
    
    init(session: URLSession) {
        self.session = session
    }
    
    init(withSessionConfiguration: URLSessionConfiguration) {
        self.session = URLSession(configuration: withSessionConfiguration)
    }
}

protocol NetworkDataTask: class, NetworkTaskType {
    associatedtype Model
    func load(withCompletion completion: @escaping (Result<Model>?) -> Void)
    func decode(_ data: Data) -> Result<Model>?
}

extension NetworkDataTask {
    fileprivate func load(_ urlRequest: URLRequest, withCompletion completion: @escaping (Result<Model>?) -> Void) {
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: urlRequest, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(self?.decode(data))
        })
        task.resume()
    }
}

class ApiRequest<Resource: ApiResource>: NetworkDataTask {
    var parentSession: NetworkSession
    
    let resource: Resource
    
    init(resource: Resource, session: NetworkSession) {
        self.parentSession = session
        self.resource = resource
    }
    
    func decode(_ data: Data) -> Result<Resource.Model>? {
        return resource.makeModelFrom(data: data)
    }
    
    func load(withCompletion completion: @escaping (Result<Resource.Model>?) -> Void) {
        if let request = resource.urlRequest() {
            load(request, withCompletion: completion)
        } else {
            completion(.Failure(NetworkTaskError.CouldNotCreateURLRequest))
        }
    }
}

class ImageRequest<T: UIImage>: NetworkDataTask {
    var parentSession: NetworkSession
    let url: URL
    
    init(url: URL, session: NetworkSession) {
        self.url = url
        self.parentSession = session
    }
    
    func decode(_ data: Data) -> Result<T>? {
        if let image = T.init(data: data) {
            return .Success(image)
        } else {
            return nil
        }
    }
    
    func load(withCompletion completion: @escaping (Result<T>?) -> Void) {
        load(URLRequest(url: url), withCompletion: completion)
    }
}
