//
//  ResultOfSearchByFlightNumberPresenter.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import UIKit

class ResultOfSearchByFlightNumberPresenter: ResultsOfSearchByFlightNumberScreenInput {

    weak var output: ResultOfSeacrhByFlightNumberScreenOutput?
    
    var searchString: String?
    
    weak var view: ResultOfSearchByFlightNumberViewInput?
    
    var airlines: [AirlinePresentationModel] = [AirlinePresentationModel]()
    var transports: [FlightNumberPresentationModel] = [FlightNumberPresentationModel]()
    
    func update(_ searchString: String) {
        self.searchString = searchString
        // обновляем скрин соглансо нового состояния
    }

    
    // MARK: - Private
    
    private func createAirlinesArray() {
        
        airlines.append(
            AirlinePresentationModel(
                airlineBrand: "American Airlines",
                aviacompanyLogo: UIImage(
                    named: "AmericanAirlines-100") ?? UIImage(),
                action: { [weak self] in
                    
                    self?.output?.didSelect(airline: "American Airlines")
                    
            }
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
            FlightNumberPresentationModel(flightNumber: "AA1",
                              flightDescription: "Air transport",
                              aviacompanyLogo: UIImage(named: "AmericanAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "AmericanAirlines-50", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberPresentationModel(flightNumber: "BA15",
                              flightDescription: "Air transport",
                              aviacompanyLogo: UIImage(named: "BritishAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "airplane", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberPresentationModel(flightNumber: "DL11",
                              flightDescription: "Air transport",
                              aviacompanyLogo: UIImage(named: "DeltaAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "ferry", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberPresentationModel(flightNumber: "C28121",
                              flightDescription: "Air transport",
                              aviacompanyLogo: UIImage(named: "FedexAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "bus", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberPresentationModel(flightNumber: "AY1",
                              flightDescription: "Air transport",
                              aviacompanyLogo: UIImage(named: "FinnairAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberPresentationModel(flightNumber: "IB594",
                              flightDescription: "",
                              aviacompanyLogo: UIImage(named: "IberiaAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberPresentationModel(flightNumber: "KL427",
                              flightDescription: "",
                              aviacompanyLogo: UIImage(named: "KlmAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberPresentationModel(flightNumber: "LH25",
                              flightDescription: "",
                              aviacompanyLogo: UIImage(named: "Lufthansa-100")!)
//                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberPresentationModel(flightNumber: "WN18",
                              flightDescription: "",
                              aviacompanyLogo: UIImage(named: "SouthwestAirlines-100-2")!)
//                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberPresentationModel(flightNumber: "UA1",
                              flightDescription: "",
                              aviacompanyLogo: UIImage(named: "UnitedAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberPresentationModel(flightNumber: "5X3",
                              flightDescription: "",
                              aviacompanyLogo: UIImage(named: "UpsAirlines-100")!)
//                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberPresentationModel(flightNumber: "VS5",
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
    
    func userDidSelect(flight: FlightNumberPresentationModel) {
        output?.didSelect(flight: flight)
    }
    
    func userDidSelect(airline: AirlinePresentationModel) {
        output?.didSelect(airline: airline.airlineBrand)
    }
}
