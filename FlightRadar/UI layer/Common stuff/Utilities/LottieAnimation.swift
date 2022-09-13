//
//  LottieAnimation.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 13.09.2022.
//

import UIKit

enum LottieAnimation: String {
    case start = "Plane"
//        case loading = "Loading"
//        case open = "Open"
    
    func name(userInterfaceStyle: UIUserInterfaceStyle) -> String {
        switch userInterfaceStyle {
        case .dark:
            return rawValue + "_dark"
        case .light, .unspecified:
            fallthrough
        @unknown default:
            return rawValue + "_light"
        }
    }
}
