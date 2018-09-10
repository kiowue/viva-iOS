//
//  JSONResourceType.swift
//  Viva1
//
//  Created by vishwender on 11/20/17.
//  Copyright © 2017 viva. All rights reserved.
//

import Foundation

public protocol JSONResourceType: ResourceType {
    
    // CoreData to Model conversion
    func makeModelFrom<T>(coreDataItem item: T) -> Model?

    // Network to Model conversion
    func makeModelFrom(jsonDictionary: [String : Any]) -> Model?
    
    func makeModelFrom(jsonArray: [Any]) -> Model?
}

// MARK: - Parsing defaults
extension JSONResourceType {
    
    public func makeModelFrom<T>(coreDataItem item: T) -> Model? { return nil }
    
    public func makeModelFrom(jsonDictionary: [String : Any]) -> Model? { return nil }
    
    public func makeModelFrom(jsonArray: [Any]) -> Model? { return nil }
}

enum JSONParsingError: Error {
    case InvalidJSONData
    case CannotParseJSONDictionary
    case CannotParseJSONArray
    case UnsupportedType
}

// MARK: - Convenince parsing functions
extension JSONResourceType {
    
    func makeModelFrom(data: Data) -> Result<Model> {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
            return .Failure(JSONParsingError.InvalidJSONData)
        }
        
        if let jsonDictionary = jsonObject as? [String: Any] {
            return resultFrom(jsonDictionary: jsonDictionary)
        }
        
        if let jsonArray = jsonObject as? [Any] {
            return resultFrom(jsonArray: jsonArray)
        }
        
        // This is likely an impossible case since `JSONObjectWithData` likely only returns [String: AnyObject] or [AnyObject] but still needed to appease the compiler
        return .Failure(JSONParsingError.UnsupportedType)
    }
    
    private func resultFrom(jsonDictionary: [String: Any]) -> Result<Model> {
        guard let parsedResult = makeModelFrom(jsonDictionary: jsonDictionary) else {
            return .Failure(JSONParsingError.CannotParseJSONDictionary)
        }
        return .Success(parsedResult)
    }
    
    private func resultFrom(jsonArray: [Any]) -> Result<Model> {
        guard let parsedResult = makeModelFrom(jsonArray: jsonArray) else {
            return .Failure(JSONParsingError.CannotParseJSONArray)
        }
        return .Success(parsedResult)
    }
    
}
