//
//  ScheduleTextField.swift
//  UniScheduleMi
//
//  Created by giulia.floris on 25/03/25.
//

import SwiftUI

struct ScheduleTextField: View {
    
    @Binding var string: String
    public var placeHolder: String = ""
    var isSecure: Bool?
    
    
    var body: some View {
        
        if !(isSecure ?? false) {
            TextField(placeHolder, text: $string)
                .frame(maxWidth: 350)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.scheduleIndigoBlue)
                )
        } else {
            SecureField(placeHolder, text: $string)
                .frame(maxWidth: 350)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.scheduleIndigoBlue)
                )
        }
    }
}

#Preview {
    
    @Previewable @State var efefe: String = "ciao"
    ScheduleTextField(string: $efefe)
}
