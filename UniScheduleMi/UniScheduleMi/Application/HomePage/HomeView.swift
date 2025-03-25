//
//  HomeView.swift
//  UniScheduleMi
//
//  Created by giulia.floris on 25/03/25.
//

import SwiftUI

struct HomeView: View {
    
    var authModel: AuthModel?
    
    @Binding var isLoggedIn: Bool // here is the Binding
    
    @State private var showModal = false
    @State private var descriptionModal = "errore"
    
    var body: some View {
        
        ZStack {
            VStack {
                
                
                BouncyImage(image: "heart.fill")
                
                Text("Benvenuto su UniScheduleMi \(LocalStorage.sharedInstance.getName() ?? "name error")")
                    .padding(.vertical, 20)
                
                ScheduleButton(title: "Logout", completion: {
                    authModel?.logout(completion: { error in
                        
                        descriptionModal = error ?? ""
                        Debugger.logger(" Registrati \(descriptionModal)")
                        if error != "" &&  error != nil  { self.showModal = true }
                        return
                        
                    })
                    
                    isLoggedIn = false
                })
            }
            
        }
        
        .overlay {
            if showModal { ErrorView(showAlert: self.$showModal, description: $descriptionModal) } }
    }
}

#Preview {
    @Previewable @State var isLoggedIn: Bool = false
    
    HomeView(isLoggedIn: $isLoggedIn)
}
