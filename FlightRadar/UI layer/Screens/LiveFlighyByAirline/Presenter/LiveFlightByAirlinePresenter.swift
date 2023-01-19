//
//  LiveFlightByAirlinePresenter.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 18.01.2023.
//

import Foundation

class LiveFlightByAirlinePresenter: LiveFlightByAirlineScreenInput {
   
    var output: LiveFlightByAirlineScreenOutput?
    
    weak var view: LiveFlightByAirlineViewInput?
    
    var searchString: String?

}

extension LiveFlightByAirlinePresenter: LiveFlightByAirlineViewOutput {
}
