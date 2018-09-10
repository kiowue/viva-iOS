//
//  NetworkResourceType.swift
//  Viva1
//
//  Created by vishwender on 11/20/17.
//  Copyright © 2017 viva. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case GET
    case POST
//    case PATCH
    case DELETE
//    case HEAD
//    case PUT
}

/**
 *  Protocol used to define a resource to be retrieved from the network
 */
public protocol NetworkResourceType {
    /// The URL of the resource
    var url: URL { get set}
    
    var HTTPRequestMethod: HTTPMethod { get }
    
    var HTTPHeaderFields: [String: String]? { get }
    
    /// The HTTP body as JSON used to fetch this resource
    var JSONBody: AnyObject? { get }
    
    /// The query items to be added to the url to fetch this resource
    var queryItems: [URLQueryItem]? { get }
    
    init(url: URL)
    
    /**
     Convenience function that builds a URLRequest for this resource
     
     - returns: A URLRequest or nil if the construction of the request failed
     */
    func urlRequest() -> URLRequest?
}

// MARK: - NetworkJSONResource defaults
public extension NetworkResourceType {
    
    public var HTTPRequestMethod: HTTPMethod { return .GET }
    public var HTTPHeaderFields: [String: String]? { return [:] }
    public var JSONBody: AnyObject? { return nil }
    public var queryItems: [URLQueryItem]? { return nil }
    
    public func urlRequest() -> URLRequest? {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = queryItems
        
        guard let urlFromComponents = urlComponents?.url else { return nil }
        
        var request = URLRequest(url: urlFromComponents)
        request.allHTTPHeaderFields = HTTPHeaderFields
        request.httpMethod = HTTPRequestMethod.rawValue
        print(request.allHTTPHeaderFields ?? "No header field present")
        if let body = JSONBody {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        }
        
        return request
    }
}

public protocol NetworkJSONResourceType: NetworkResourceType, JSONResourceType {}

// MARK: - NetworkJSONResourceType defaults
public extension NetworkJSONResourceType {
    var HTTPHeaderFields: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
