//
//  Debugger.swift
//  UniScheduleMi
//
//  Created by giulia.floris on 25/03/25.
//


final class Debugger {
    
    static func logger(_ text: String, _ urgent: Bool? = false) {
        
        let icon = (urgent ?? false) == true ? "❗️" : ""
        
        print("[Debugger] || \(icon) \(text)")
        
    }
    
}
