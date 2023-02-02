//
//  LiveFlightByAirlineViewOutput.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 18.01.2023.
//

import Foundation

protocol LiveFlightByAirlineViewOutput: AnyObject {
    func didLoadView()
    func userDidSelect(airlines: AirlineListPresentationModel)
}
