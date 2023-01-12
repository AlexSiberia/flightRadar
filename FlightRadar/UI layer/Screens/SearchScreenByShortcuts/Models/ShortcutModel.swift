//
//  ShortcutModel.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.12.2022.
//

import UIKit

struct ShortCutModel {
    var title: String
    var logo: UIImage
    
    var didSelect: () -> ()
}
