//
//  SearchScreenByShortcutsScreenInput.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 04.01.2023.
//

import Foundation

protocol SearchScreenByShortcutsScreenInput: AnyObject {
    
    func update(_ searchString: String)
}
