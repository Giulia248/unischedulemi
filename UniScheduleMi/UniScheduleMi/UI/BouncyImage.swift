//
//  BouncyImage.swift
//  UniScheduleMi
//
//  Created by giulia.floris on 25/03/25.
//

import SwiftUI

struct BouncyImage: View {
    
    var image: String
    
    @State private var isBouncing = false
    var body: some View {
        
        Image(systemName: image)
        
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 30)
            .scaleEffect(isBouncing ? 1.2 : 1.0) // Scale up & down
            .foregroundStyle( ScheduleColors.gradiend )
            .animation(
                Animation.interpolatingSpring(stiffness: 100, damping: 5)
                    .repeatForever(autoreverses: true),
                value: isBouncing
            )
            .onAppear {
                isBouncing = true
            }
    }
}

#Preview {
    
    
    BouncyImage(image: "book.pages")
}
