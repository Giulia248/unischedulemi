//
//  ScheduleButton.swift
//  UniScheduleMi
//
//  Created by giulia.floris on 25/03/25.
//

import SwiftUI

struct ScheduleButton: View {
    
    
    var title: String
    var completion: (() -> ())
    
    
    var body: some View {
        
        ZStack {
            Button(title) {  }
                .frame(maxWidth: 250)
                .padding(.vertical, 10)
            
            
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.scheduleIndigoBlue)
                        .fill(.scheduleIndigoLight)
                    
                )
            Button(title) {
                completion()
            }
            .foregroundStyle(LinearGradient(colors: [.black], startPoint: .bottom, endPoint: .bottom))
            
        }
        
        
    }
}

#Preview {
    
    var completion:(() -> ())   =  { print("")}
    ScheduleButton(title: "test", completion: completion)
}
