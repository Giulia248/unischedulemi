//
//  LocalStorage.swift
//  UniScheduleMi
//
//  Created by giulia.floris on 25/03/25.
//

import Foundation


final class LocalStorage {
    
    static let sharedInstance = LocalStorage()
    
    // KEYS
    let nameKey = "scheduleName"
    
    
    
    let defaults = UserDefaults.standard
    
    // name
    internal func setName(_ name: String? = nil) {
        Debugger.logger("[LocalStorage] setName \(name ?? "no name found")")
        if (name != "") { defaults.set(name, forKey: nameKey) }
    }
    
    internal func getName() -> String? {
        Debugger.logger("[LocalStorage] getName \(defaults.string(forKey: nameKey) ?? "no name found")")
        return defaults.string(forKey: nameKey)
    }
    
}
