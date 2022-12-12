//
//  SearchViewInput.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 31.08.2022.
//

import Foundation

protocol SearchViewInput: AnyObject {
    
    func didObtain(currentLocation: Location)
    
    func showAirportsPin(_ pins: MapViewData)
}
