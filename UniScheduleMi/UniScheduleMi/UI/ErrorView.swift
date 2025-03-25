//
//  ErrorView.swift
//  UniScheduleMi
//
//  Created by giulia.floris on 25/03/25.
//

import SwiftUI

struct ErrorView: View {
    
    
    
    @Binding var showAlert: Bool
    
    @Binding var description: String
    var body: some View {
        
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                
            
            
            VStack {
                
                HStack {
                    
                    Spacer()
                        .frame(maxWidth: 250)
                        
                    
                    Button(action: {
                        self.showAlert = false

                         }) {
                             Image(systemName: "multiply")
                                 .resizable()
                                 .frame(width: 10, height: 10, alignment: .trailing)
                                 .padding(.bottom, 30)
                         }
                    
                   
                        
                }
                
                Image(systemName: "multiply")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .padding()
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.red, lineWidth: 4)
                            
                            
                    })
                
                Text("Attenzione")
                    .font(.title)
                
                Text(description)
                    .lineLimit(3)
                
            }
            .frame(maxWidth: 300)
            .padding(.bottom, 40)
            .padding(.top, 30)
            .padding(.horizontal, 20)
          
            .background(.white)
            .clipShape(.rect(cornerRadius: 10))
            
            
        }
        
    }
}

#Preview {
    
    @Previewable @State var showModal = false
    @Previewable @State var desc = "false"
    ErrorView(showAlert: $showModal, description: $desc)
}
