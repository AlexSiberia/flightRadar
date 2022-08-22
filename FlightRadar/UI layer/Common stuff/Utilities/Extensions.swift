//
//  Model.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 08.02.2022.
//

import Foundation
import UIKit

// MARK: Enum

//enum ColorPallete {
//    case backgroundColor
//    case textColor
//    case iconColor
//}
//
//// MARK: - Extention
//
//extension UIColor {
//    static func tableColor(_ name: ColorPallete) -> UIColor? {
//        switch name {
//        case .backgroundColor:
//            return UIColor(named: "backgroundColor")
//        case .textColor:
//            return UIColor(named: "textColor")
//        case .iconColor:
//            return UIColor(named: "iconColor")
//        }
//    }
//}

enum FirstScreenColor {
    case backgroundColor
    case textColor
    case shadowColor
    case iconColor
}

// MARK: Extention

extension UIColor {
    static func appColor(_ name: FirstScreenColor) -> UIColor? {
        switch name {
        case .backgroundColor:
            return UIColor(named: "BackgroundColor")
        case .textColor:
            return UIColor(named: "TextColor")
        case .shadowColor:
            return UIColor(named: "ShadowColor")
        case .iconColor:
            return UIColor(named: "IconColor")
        }
    }
}

extension UIFont {
    
    func withTraits(_ traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        
        // create a new font descriptor with the given traits
        guard let fd = fontDescriptor.withSymbolicTraits(traits) else {
            // the given traits couldn't be applied, return self
            return self
        }
        
        // return a new font with the created font descriptor
        return UIFont(descriptor: fd, size: pointSize)
    }
    
    func italics() -> UIFont {
        return withTraits(.traitItalic)
    }
    
    func bold() -> UIFont {
        return withTraits(.traitBold)
    }
    
    func boldItalics() -> UIFont {
        return withTraits([ .traitBold, .traitItalic ])
    }
}

extension UIView {
    
    /// Добавляем группу subview
    /// - Parameter views: массив добавляемых view
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
