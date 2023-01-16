//
//  SearchScreenByShortcutsScreenOutput.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 04.01.2023.
//

import Foundation

protocol SearchScreenByShortcutsScreenOutput: AnyObject {
    
    func didSelectFlightByRoute()
    func didSelectLiveFlightByAirline()
    func didSelectFlightByAirportByCountry()
}
