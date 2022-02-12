//
//  Model.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 08.02.2022.
//

import Foundation
import UIKit

enum FirstScreenColor {
    case backgroundColor
    case textColor
    case shadowColor
}

extension UIColor {
    static func appColor(_ name: FirstScreenColor) -> UIColor? {
        switch name {
        case .backgroundColor:
            return UIColor(named: "BackgroundColor")
        case .textColor:
            return UIColor(named: "TextColor")
        case .shadowColor:
            return UIColor(named: "ShadowColor")
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
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}