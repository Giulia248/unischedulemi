//
//  LoginViewModel.swift
//  UniScheduleMi
//
//  Created by giulia.floris on 25/03/25.
//

import SwiftUICore


@Observable
final class LoginViewModel{
    
    var authModel: AuthModel?
    init(authModel: AuthModel? = nil) {
        self.authModel = authModel
    }
    
    internal func login (email: String, password: String , completion: @escaping (_ : String?) -> ()){
        
        ScheduleLoading.sharedInstance.startLoading()
        
        authModel?.login(email: email, password: password, completion: { valid in
            completion(valid)
            let name: String = String(email.split(separator: "@").first ?? "")
            if let _ = valid { LocalStorage.sharedInstance.setName(String(name))}
            ScheduleLoading.sharedInstance.stopLoading()
        })
    }
    
    
    
    internal func register (email: String, password: String , completion: @escaping (_ : String?) -> ()){
        
        ScheduleLoading.sharedInstance.startLoading()
        
        authModel?.signUp(email: email, password: password, completion: { valid in
            completion(valid)
            let name: String = String(email.split(separator: "@").first ?? "")
            if let _ = valid { LocalStorage.sharedInstance.setName(String(name))}
            ScheduleLoading.sharedInstance.stopLoading()
        })
        
    }
    
    internal func logout (completion: @escaping (_ : String?) -> ()){
        
        ScheduleLoading.sharedInstance.startLoading()
        authModel?.logout(completion: {  valid in
            
            completion(valid)
            ScheduleLoading.sharedInstance.stopLoading()
            
        })
    }
}
