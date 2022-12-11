//
//  SearchScreenPresenter.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 04.08.2022.
//

import Foundation
import CoreLocation

class SearchScreenPresenter: SearchScreenInput {
 
    // MARK: - Output
    weak var output: SearchScreenOutput?
    
    weak var view: SearchViewInput?
    
    var airports: [AirportModel] = [AirportModel]()
    
    var locationService: LocationServiceProtocol?
    
    var recievedLocation: Location?
    
    // MARK: - Private
    
    private func createAirportsArray() {
        
        airports.append(
            AirportModel(
                title: "Yuzhnyy Airport",
                coordinate: CLLocationCoordinate2D(latitude: 41.152830, longitude: 69.165227),
                info: "Uzbekistan"
            )
        )
        airports.append(
            AirportModel(
                title: "Sheremetyevo",
                coordinate: CLLocationCoordinate2D(latitude: 55.582151, longitude: 37.245252),
                info: "Russia"
            )
        )
    }
    
}

extension SearchScreenPresenter: SearchViewOutput {
    
    func didLoadView() {
        createAirportsArray()
        
        let viewData = MapViewData(airports: airports)
        view?.showAirportsPin(viewData)
    }
    
    func didReceive(searchString: String) {
        output?.didReceive(searchString: searchString)
    }
    
    func didAskToObtainCurrentLocation() {
        locationService?.requestCurrentLocation()
    }
}

extension SearchScreenPresenter: LocationServiceDelegate {
    func didRecieveLocation(
        _ service: LocationServiceProtocol,
        location: Location
    ) {
        recievedLocation = location
        view?.didObtain(currentLocation: location)
    }
    
    
}
