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

        locationService?.requestCurrentLocation()
        // идем в сеть за результами поиска
        // обрабатываем (например сортируем)
        // отдаем на отображение
        
    }
    
    func didReceive(searchString: String) {
//        searchString.trimPrefix(<#T##prefix: Sequence##Sequence#>)
        output?.didReceive(searchString: searchString)
    }
}

extension SearchScreenPresenter: LocationServiceDelegate {
    func didRecieveLocation(_ service: LocationServiceProtocol, location: Location) {
        
//        locationService?
//        locationService = service
////        let location = Location(longitude: location.longitude, latitude: location.latitude)
//        recievedLocation = location
    }
    
    
}
