//
//  SearchScreenByShortcutsOutput.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 26.12.2022.
//

import Foundation

protocol SearchScreenByShortcutsViewOutput: AnyObject {
    
    func didLoadView()
    func userDidSelect(shortcut: ShortCutModel)
    //    func userDidSelect(flight: FlightNumberModel)
    //    func userDidSelect(airline: AirlineModel)
}
