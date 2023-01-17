//
//  FlightByRoutePresenter.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 16.01.2023.
//

import Foundation

class FlightByRoutePresenter: FlightByRouteScreenInput {
 
    // MARK: - Output
    weak var output: FlightByRouteScreenOutput?
    
    weak var view: FlightByRouteViewInput?
    
    // MARK: - Private
    
}

extension FlightByRoutePresenter: FlightByRouteViewOutput {
    func didLoadView() {
    }
}
