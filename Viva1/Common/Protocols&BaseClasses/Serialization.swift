//
//  Serialization.swift
//  Viva1
//
//  Created by vishwender on 11/20/17.
//  Copyright © 2017 viva. All rights reserved.
//

import Foundation

typealias Serialization = [String: Any]

protocol SerializationValue {}

extension Bool: SerializationValue {}
extension String: SerializationValue {}
extension Int: SerializationValue {}
extension Dictionary: SerializationValue {}
extension Array: SerializationValue {}

extension Dictionary where Key == String, Value: Any {
    func value<V: SerializationValue>(forKey key: String) -> V? {
        return self[key] as? V
    }
}
