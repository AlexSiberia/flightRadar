//
//  FirstScreenOutput.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 07.08.2022.
//

import Foundation

protocol FirstScreenOutput: AnyObject {
    func didSelectSearchByFightNumber()
    func didSelectSearchByAirportTimetable()
}
