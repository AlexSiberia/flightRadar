//
//  ResultOfSearchByFlightNumberPresenter.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import UIKit

class ResultOfSearchByFlightNumberPresenter: ResultsOfSearchByFlightNumberScreenInput {

    weak var output: ResultOfSeacrhByFlightNumberScreenOutput?
    var context: ResultOfSearchByFlightNumberScreenContext = ResultOfSearchByFlightNumberScreenContext()
    
    weak var view: ResultOfSearchByFlightNumberViewInput?
    
    var airlines: [AirlineModel] = [AirlineModel]()
    var transports: [FlightNumberModel] = [FlightNumberModel]()

    
    // MARK: - Private
    
    private func createAirlinesArray() {
        
        airlines.append(
            AirlineModel(
                airlineBrand: "AmericanA irlines",
                aviacompanyLogo: UIImage(named: "AmericanAirlines-100") ?? UIImage()
            )
        )
    }
    
    private func createFlightNumberArray() {
        
//        let symbolConfig = UIImage.SymbolConfiguration(
//            paletteColors: [
//                UIColor.appColor(.iconColor)!,
//                .systemYellow
//            ]
//        )
//        let sizeConf = UIImage.SymbolConfiguration(scale: .large)
//        let config = symbolConfig.applying(sizeConf)
        
        transports.append(
            FlightNumberModel(flightNumber: "AA1",
                              flightDescription: "Air transport",
                              aviacompanyLogo: UIImage(named: "AmericanAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "AmericanAirlines-50", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "BA15",
                              flightDescription: "Air transport",
                              aviacompanyLogo: UIImage(named: "BritishAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "airplane", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "DL11",
                              flightDescription: "Air transport",
                              aviacompanyLogo: UIImage(named: "DeltaAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "ferry", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "C28121",
                              flightDescription: "Air transport",
                              aviacompanyLogo: UIImage(named: "FedexAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "bus", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "AY1",
                              flightDescription: "Air transport",
                              aviacompanyLogo: UIImage(named: "FinnairAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "IB594",
                              flightDescription: "",
                              aviacompanyLogo: UIImage(named: "IberiaAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "KL427",
                              flightDescription: "",
                              aviacompanyLogo: UIImage(named: "KlmAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "LH25",
                              flightDescription: "",
                              aviacompanyLogo: UIImage(named: "Lufthansa-100")!)
//                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "WN18",
                              flightDescription: "",
                              aviacompanyLogo: UIImage(named: "SouthwestAirlines-100-2")!)
//                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "UA1",
                              flightDescription: "",
                              aviacompanyLogo: UIImage(named: "UnitedAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "5X3",
                              flightDescription: "",
                              aviacompanyLogo: UIImage(named: "UpsAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "VS5",
                              flightDescription: "",
                              aviacompanyLogo: UIImage(named: "VirginAtlanticAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
    }
}

extension ResultOfSearchByFlightNumberPresenter: ResultOfSearchByFlightNumberViewOutput {
    
    func didLoadView() {
        view?.showLoadingState()
        
        createAirlinesArray()
        createFlightNumberArray()
        
        let viewData = ResultOfSearchByFlightNumberViewData(
            airlines: airlines,
            flights: transports
        )
        view?.showDataState(viewData)
    }
    
    func userDidSelect(flight: FlightNumberModel) {
        output?.didSelect(flight: flight)
    }
    
    func userDidSelect(airline: AirlineModel) {
        output?.didSelect(airline: airline)
    }
}
