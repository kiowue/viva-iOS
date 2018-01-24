//
//  Result.swift
//  Viva1
//
//  Created by vishwender on 11/20/17.
//  Copyright © 2017 viva. All rights reserved.
//

import Foundation

public enum Result<T> {
    case Success(T)
    case Failure(Error)
}

extension Result {
    
    /// Returns the success result if it exists, otherwise nil
    func successResult() -> T? {
        switch self {
        case .Success(let successResult):
            return successResult
        case .Failure:
            return nil
        }
    }
    
    /// Returns the error if it exists, otherwise nil
    func error() -> Error? {
        switch self {
        case .Success:
            return nil
        case .Failure(let error):
            return error
        }
    }
}
