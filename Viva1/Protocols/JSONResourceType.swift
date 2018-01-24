//
//  JSONResourceType.swift
//  Viva1
//
//  Created by vishwender on 11/20/17.
//  Copyright © 2017 viva. All rights reserved.
//

import Foundation

public protocol JSONResourceType: ResourceType {

    func makeModelFrom(jsonDictionary: [String : AnyObject]) -> Model?
    
    func makeModelFrom(jsonArray: [AnyObject]) -> Model?
}

// MARK: - Parsing defaults
extension JSONResourceType {
    
    public func makeModelFrom(jsonDictionary: [String : AnyObject]) -> Model? { return nil }
    
    public func makeModelFrom(jsonArray: [AnyObject]) -> Model? { return nil }
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
        
        if let jsonDictionary = jsonObject as? [String: AnyObject] {
            return resultFrom(jsonDictionary: jsonDictionary)
        }
        
        if let jsonArray = jsonObject as? [AnyObject] {
            return resultFrom(jsonArray: jsonArray)
        }
        
        // This is likely an impossible case since `JSONObjectWithData` likely only returns [String: AnyObject] or [AnyObject] but still needed to appease the compiler
        return .Failure(JSONParsingError.UnsupportedType)
    }
    
    private func resultFrom(jsonDictionary: [String: AnyObject]) -> Result<Model> {
        guard let parsedResult = makeModelFrom(jsonDictionary: jsonDictionary) else {
            return .Failure(JSONParsingError.CannotParseJSONDictionary)
        }
        return .Success(parsedResult)
    }
    
    private func resultFrom(jsonArray: [AnyObject]) -> Result<Model> {
        guard let parsedResult = makeModelFrom(jsonArray: jsonArray) else {
            return .Failure(JSONParsingError.CannotParseJSONArray)
        }
        return .Success(parsedResult)
    }
    
}
