//
//  Defaults.swift
//  WatchList
//
//  Created by Alex Grimes on 8/14/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import Foundation

struct Defaults {
    
    static let (nameKey, addressKey, passwordKey) = ("name", "address", "password")
    
    static func setName(_ name: String){
        UserDefaults.standard.set(name, forKey: nameKey)
    }

    static func getName() -> String? {
        return UserDefaults.standard.string(forKey: nameKey) ?? nil
    }
    
    static func clearUserData() {
        UserDefaults.standard.removeObject(forKey: nameKey)
        UserDefaults.standard.removeObject(forKey: passwordKey)
        UserDefaults.standard.removeObject(forKey: addressKey)
    }
}
