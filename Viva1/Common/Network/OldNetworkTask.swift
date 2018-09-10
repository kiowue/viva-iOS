//
//  OldNetworkTask.swift
//  Viva1
//
//  Created by vishwender on 8/18/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit
/*
public enum NetworkTaskError: Error {
    case CouldNotCreateURLRequest
    case StatusCodeError(statusCode: Int)
    case NetworkingError(error: NSError)
    case NoData
}

//public protocol NetworkTaskType {
//    var parentSession: NetworkSession {get}
//}

public class NetworkSession {
    let session: URLSession
    static let defaultSession = URLSession()
    let sessionConfiguration: URLSessionConfiguration = .default
    
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
            self.remoteRequestHandler?.decode(data)
        })
        task.resume()
    }
}

protocol NetworkDataManagerOutputProtocol {
    func decode(_ data: Data?)
}

//protocol NetworkDataTask: class, NetworkTaskType {
//    associatedtype Model
//    func load(withCompletion completion: @escaping (Result<Model>?) -> Void)
//    func decode(_ data: Data) -> Result<Model>?
//}

//extension NetworkDataTask {
//    fileprivate func load(_ urlRequest: URLRequest, withCompletion completion: @escaping (Result<Model>?) -> Void) {
//        let task = parentSession.session.dataTask(with: urlRequest, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
//            guard let data = data else {
//                completion(nil)
//                return
//            }
//            completion(self?.decode(data))
//        })
//        task.resume()
//    }
//}

class ApiRequest<Resource: ApiResource>: /*NetworkDataTask*/ NetworkDataManagerInputProtocol {
    var parentSession: NetworkSession
    
    var remoteRequestHandler: NetworkDataManagerOutputProtocol?
    let resource: Resource
    
    init(resource: Resource, session: NetworkSession) {
        self.parentSession = session
        self.resource = resource
    }
    
    init(resource: Resource) {
        //        let configuration = URLSessionConfiguration.ephemeral
        //        let session = URLSession(configuration: configuration)
        //        self.parentSession = NetworkSession(session: session)
        self.parentSession = NetworkSession()
        self.resource = resource
    }
    
    func fetchData() {
        fetch(self.resource.urlRequest())
    }
    
    //    func decode(_ data: Data) -> Result<Model>? {
    //        return resource.makeModelFrom(data: data)
    //    }
    
    //    func load(withCompletion completion: @escaping (Result<Resource.Model>?) -> Void) {
    //        if let request = resource.urlRequest() {
    //            load(request, withCompletion: completion)
    //        } else {
    //            completion(.Failure(NetworkTaskError.CouldNotCreateURLRequest))
    //        }
    //    }
}

//class ImageRequest<T: UIImage>: NetworkDataTask {
//    var parentSession: NetworkSession
//    let url: URL
//
//    init(url: URL, session: NetworkSession) {
//        self.url = url
//        self.parentSession = session
//    }
//
//    func decode(_ data: Data) -> Result<T>? {
//        if let image = T.init(data: data) {
//            return .Success(image)
//        } else {
//            return nil
//        }
//    }
//
//    func load(withCompletion completion: @escaping (Result<T>?) -> Void) {
//        load(URLRequest(url: url), withCompletion: completion)
//    }
//}
 */
