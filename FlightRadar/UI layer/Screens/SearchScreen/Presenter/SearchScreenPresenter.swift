//
//  SearchScreenPresenter.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 04.08.2022.
//

import Foundation

class SearchScreenPresenter: SearchScreenInput {
 
    // MARK: - Output
    weak var output: SearchScreenOutput?
    
    weak var view: SearchViewInput?
    
    var locationService: LocationServiceProtocol?
    
    var recievedLocation: Location?
    
}

extension SearchScreenPresenter: SearchViewOutput {
    
    func didLoadView() {
        // идем в сеть за результами поиска
        // обрабатываем (например сортируем)
        // отдаем на отображение
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
