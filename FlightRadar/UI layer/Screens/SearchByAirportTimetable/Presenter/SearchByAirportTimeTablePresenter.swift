//
//  SearchByAirportTimeTablePresenter.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 13.03.2022.
//

import Foundation

class SearchByAirportTimeTablePresenter: SearchByAirportTimeTableInput {
    
    // MARK: - Output
    weak var output: SearchByAirportTimeTablelOutput?
    
    weak var view: SearchByAirportTimeTableViewController?
    
    func didLoadView() {
        
        // идем в сеть за данными
        // обрабатываем (например сортируем)
        // отдаем на отображение
        
    }
    
    
}
