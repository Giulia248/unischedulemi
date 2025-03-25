//
//  UniScheduleMiApp.swift
//  UniScheduleMi
//
//  Created by giulia.floris on 25/03/25.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}




@main
struct UniScheduleMiApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let authModel = AuthModel()
    @State var isLoggedIn: Bool = ( (LocalStorage.sharedInstance.getName() ?? "") == "" ? false : true )
    var body: some Scene {
        WindowGroup {
            
            
            if isLoggedIn {
                
                HomeView(authModel: authModel, isLoggedIn: $isLoggedIn)
            }
            else {
                LoginView(viewModel: LoginViewModel(authModel: authModel), isLoggedIn: $isLoggedIn)
            }
        }
    }
}
