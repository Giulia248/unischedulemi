//
//  ScheduleLoading.swift
//  UniScheduleMi
//
//  Created by giulia.floris on 25/03/25.
//


import SwiftUI
import ProgressHUD


final class ScheduleLoading: ObservableObject {
    
    static let sharedInstance = ScheduleLoading()
    private let loaderUi: AnimationType = .dualDotSidestep
    private let loaderColor: UIColor = UIColor.hexStringToUIColor(hex: ScheduleColors.scheduleIndigo)
    
    internal func startLoading( ){
        
        ProgressHUD.animationType = loaderUi
        ProgressHUD.colorAnimation = loaderColor
        ProgressHUD.animate("", interaction: false)
    }
    
    internal func stopLoading() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            ProgressHUD.dismiss()
        }
        
    }
    
    
}
