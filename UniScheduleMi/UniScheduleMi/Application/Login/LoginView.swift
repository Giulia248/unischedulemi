//
//  LoginView.swift
//  UniScheduleMi
//
//  Created by giulia.floris on 25/03/25.
//

import SwiftUI
import Combine


struct LoginView: View {
    
   
    @State internal var viewModel: LoginViewModel
    @State private var showModal = false
    @State private var descriptionModal = "errore"
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    @Binding var isLoggedIn: Bool // here is the Binding
    
    var body: some View {
        
        ZStack (alignment: .center ) {
            
            
            Color(UIColor.hexStringToUIColor(hex: ScheduleColors.scheduleIndigoLight))
                .opacity(0.3)
                .ignoresSafeArea()
            
            
            
            
            VStack {
                
                Text("UniScheduleMi")
                    .font(.title)
                
                VStack{
                    
                    
                    HStack {
                        
                        BouncyImage(image: "book.pages")
                        
                        
                        Text("Login | Registrati")
                            .padding(.horizontal, 10)
                    }
                    
                    .padding(.bottom, 30)
                    
                    ScheduleTextField(string: $email, placeHolder: "Email")
                        .textInputAutocapitalization(.never)
                    
                    ScheduleTextField(string: $password, placeHolder: "Password", isSecure: true)
                        .textContentType(.password)
                        .textInputAutocapitalization(.never)
                        .padding(.bottom, 50)
                    
                    
                    
                    ScheduleButton(title: "Login", completion: {
                        
                        viewModel.login(email: email, password: password, completion: { error in
                            descriptionModal = error ?? ""
                            Debugger.logger(" Login \(descriptionModal)")
                            if error != "" &&  error != nil  { self.showModal = true }
                            return
                        })
                        
                        isLoggedIn = true
                        
                        
                    })
                    
                    ScheduleButton(title: "Registrati", completion: {
                        
                        
                        viewModel.register(email: email, password: password, completion: { error in
                            descriptionModal = error ?? ""
                            Debugger.logger(" Registrati \(descriptionModal)")
                            if error != "" &&  error != nil  { self.showModal = true }
                            return
                        })
                        
                        isLoggedIn = true
                        
                        
                    })
                        
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 30)
                .background(.white)
                .clipShape(.rect(cornerRadius: 10))
            }
            
        }
        .overlay {
            if showModal { ErrorView(showAlert: self.$showModal, description: $descriptionModal) } }
    }
}

#Preview {
    @Previewable @State var isLoggedIn: Bool = false
    LoginView(viewModel: LoginViewModel(), isLoggedIn: $isLoggedIn)
}
