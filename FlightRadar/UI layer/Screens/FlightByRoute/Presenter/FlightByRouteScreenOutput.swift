//
//  FlightByRouteScreenOutput.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 16.01.2023.
//

import Foundation

protocol FlightByRouteScreenOutput: AnyObject {
    func didReceive(searchString: String)
}
