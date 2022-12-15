//
//  SearchViewInput.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 31.08.2022.
//

import Foundation
import CoreLocation

protocol SearchViewInput: AnyObject {
    
    func didObtain(currentLocation: CLLocationCoordinate2D)
    
    func showAirportsPin(_ pins: MapViewData)
}
