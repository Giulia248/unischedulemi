//
//  Colors.swift
//  UniScheduleMi
//
//  Created by giulia.floris on 25/03/25.
//

import UIKit
import SwiftUI

extension UIColor {
    
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}




final class ScheduleColors {
    static let scheduleIndigo = "#8742f5"
    static let scheduleIndigoLight = "#a678f0"
    static let scheduleIndigoBlue = "#7166e8"
    
    static let gradiend = LinearGradient(
        colors: [Color("ScheduleIndigo"), Color("ScheduleIndigoBlue")],
        startPoint: .top,
        endPoint: .bottom
    )
    
    
}
