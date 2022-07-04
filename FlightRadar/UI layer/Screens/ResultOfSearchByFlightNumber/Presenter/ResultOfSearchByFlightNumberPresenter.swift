//
//  ResultOfSearchByFlightNumberPresenter.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import UIKit

class ResultOfSearchByFlightNumberPresenter: ResultOfSearchByFlightNumberViewOutput {
    
    weak var view: ResultOfSearchByFlightNumberViewInput?
    weak var output: ResultOfSeacrhByFlightNumberScreenOutput?
    
    var transports: [FlightNumberModel] = [FlightNumberModel]()
    
    // MARK: - ResultOfSearchByFlightNumberViewOutput
    
    func didLoadView() {
        createFlightNumberArray()
        view?.update(with: transports)
    }
    
    // MARK: - Private
    
    private func createFlightNumberArray() {
        
        let symbolConfig = UIImage.SymbolConfiguration(
            paletteColors: [
                UIColor.appColor(.iconColor)!,
                .systemYellow
            ]
        )
        let sizeConf = UIImage.SymbolConfiguration(scale: .large)
        let config = symbolConfig.applying(sizeConf)
        
        transports.append(
            FlightNumberModel(flightNumber: "Tram",
                              flightDescription: "Earth transport",
                              aviacompanyLogo: UIImage(systemName: "tram", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "Airplane",
                              flightDescription: "Air transport",
                              aviacompanyLogo: UIImage(systemName: "airplane", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "Ferry",
                              flightDescription: "River transport",
                              aviacompanyLogo: UIImage(systemName: "ferry", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "Bus",
                              flightDescription: "Sity transport",
                              aviacompanyLogo: UIImage(systemName: "bus", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "Car",
                              flightDescription: "Sity transport",
                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
    }
}
