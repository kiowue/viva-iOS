//
//  User.swift
//  Viva1
//
//  Created by vishwender on 11/21/17.
//  Copyright © 2017 viva. All rights reserved.
//

import Foundation

struct User {
    let name: String?
    let profileImageURL: URL?
    let reputation: Int?
}

extension User {
    private enum Keys: String, SerializationKey {
        case reputation
        case name = "display_name"
        case profileImage = "profile_image"
    }
    
    init(serialization: Serialization) {
        name = serialization.value(forKey: Keys.name)
        reputation = serialization.value(forKey: Keys.reputation)
        if let url: String = serialization.value(forKey: Keys.profileImage) {
            profileImageURL = URL(string: url)
        } else {
            profileImageURL = nil
        }
    }
}

struct UserResource: ApiResource {
    typealias Model = User
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func makeModelFrom(jsonDictionary: [String : AnyObject]) -> User? {
        return User(serialization: jsonDictionary)
    }
}
