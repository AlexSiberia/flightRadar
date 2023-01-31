//
//  LiveFlightByAirlinePresenter.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 18.01.2023.
//

import UIKit

class LiveFlightByAirlinePresenter: LiveFlightByAirlineScreenInput {
   
    var output: LiveFlightByAirlineScreenOutput?
    
    weak var view: LiveFlightByAirlineViewInput?
    
    var searchString: String?
    
    private lazy var viewData: LiveFlightByAirlineViewData = createViewData()
    
    // MARK: - Private
    
    private func createViewData() -> LiveFlightByAirlineViewData {
        var airlines: [AirlineModel] = []
        
        
        airlines.append(
            AirlineModel(
                airlineBrand: "American Airlines",
                aviacompanyLogo: UIImage(named: "AmericanAirlines-100") ?? UIImage(),
                action: { [weak self] in
                    
                }
            )
        )
        
        airlines.append(
            AirlineModel(
                airlineBrand: "British Airlines",
                aviacompanyLogo: UIImage(named: "BritishAirlines-100") ?? UIImage(),
                action: { [weak self] in
                    
                }
            )
        )
        
        airlines.append(
            AirlineModel(
                airlineBrand: "Delta Airlines",
                aviacompanyLogo: UIImage(named:  "DeltaAirlines-100") ?? UIImage(),
                action: { [weak self] in
                    
                }
            )
        )
        
        airlines.append(
            AirlineModel(
                airlineBrand: "Fedex Airlines",
                aviacompanyLogo: UIImage(named:  "FedexAirlines-100") ?? UIImage(),
                action: { [weak self] in
                    
                }
            )
        )
        
        
        
        let section0: LiveFlightByAirlineViewSection = LiveFlightByAirlineViewSection(
            header: HeaderModel(title: "#"),
            airlines: []
        )
        let section1: LiveFlightByAirlineViewSection = LiveFlightByAirlineViewSection(
            header: HeaderModel(title: "A"),
            airlines: airlines
        )
        
        let viewData: LiveFlightByAirlineViewData = LiveFlightByAirlineViewData(sections: [section0, section1])
        
        return viewData
    }

}

extension LiveFlightByAirlinePresenter: LiveFlightByAirlineViewOutput {
    func didLoadView() {
        
        view?.showDataState(viewData)
    }
    
    func userDidSelect(airlines: AirlineModel) {
        
    }
    
}
