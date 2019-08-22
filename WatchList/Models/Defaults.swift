//
//  Defaults.swift
//  WatchList
//
//  Created by Alex Grimes on 8/14/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import Foundation

struct Defaults {
    
    static let (nameKey, emailKey, listsKey, countsKey) = ("name", "email", "lists", "counts")
    
    
    // MARK: - name
    static func setName(_ name: String){
        UserDefaults.standard.set(name, forKey: nameKey)
    }
    
    static func getName() -> String? {
        return UserDefaults.standard.string(forKey: nameKey) ?? nil
    }
    
    // MARK: - lists
    static func addList(named listName: String) {
        var lists = UserDefaults.standard.array(forKey: listsKey) ?? []
        lists.append(listName)
        UserDefaults.standard.set(lists, forKey: listsKey)
        UserDefaults.standard.set([String](), forKey: listName)
    }
    
    static func getLists() -> [String] {
        return UserDefaults.standard.array(forKey: listsKey) as? [String] ?? []
    }
    
    static func getCounts() -> [Int] {
        return UserDefaults.standard.array(forKey: countsKey) as? [Int] ?? []
    }
    
    // MARK: - movies
    static func addMovie(named movieName: String, toList listName: String) {
        var movieList = UserDefaults.standard.array(forKey: listName) ?? []
        movieList.append(movieName)
        UserDefaults.standard.set(movieList, forKey: listName)
    }
    
    static func getMovieList(named listName: String) -> [String] {
        return UserDefaults.standard.array(forKey: listName) as? [String] ?? []
    }

    // MARK: - clear
    static func clearUserData() {
        UserDefaults.standard.removeObject(forKey: nameKey)
        UserDefaults.standard.removeObject(forKey: emailKey)
    }
}
