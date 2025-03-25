//
//  Auth.swift
//  UniScheduleMi
//
//  Created by giulia.floris on 25/03/25.
//


import FirebaseAuth
import ProgressHUD

final class AuthModel: ObservableObject {
  
    
    
    
    func signUp(email: String, password: String, completion: @escaping (_ : String?) -> ()) {
        
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { authResult, error in
            
            guard let user = authResult?.user, error == nil else {
                
                let errorText: String  = error?.localizedDescription ?? "unknown error"
                Debugger.logger("signUp error \(errorText)", true)
                completion(errorText)
                return
            }
            
            let userName = String(user.email?.split(separator: "@").first ?? "")
            LocalStorage.sharedInstance.setName(userName)
            
            Debugger.logger("signUp succesfull")
            completion(nil)
            
        })
        
        
    }
    
    func login(email: String, password: String, completion: @escaping(_ : String?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error == nil {
                DispatchQueue.main.async {
                    completion(nil)
                    Debugger.logger("login succesfull")
                    return
                }
            }
            Debugger.logger("login error \(error?.localizedDescription ?? "")", true)
            completion(error?.localizedDescription ?? "")
        }
    }
    
    func logout(completion: @escaping (_ : String?) -> ()) {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                Debugger.logger("logout succesfull")
                completion(nil)
            }
        } catch {
            completion(error.localizedDescription)
            Debugger.logger("logout error \(error.localizedDescription)", true)
        }
    }
}
