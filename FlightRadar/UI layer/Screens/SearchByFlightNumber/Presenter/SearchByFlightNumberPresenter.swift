//
//  SearchByFlightNumberPresenter.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 10.03.2022.
//

import Foundation

class SearchByFlightNumberPresenter: SearchByFlightNumberInput {
    
    // MARK: - Output
    weak var output: SearchByFlihgtNumberOutput?
    
    weak var view: SearchByFlightNumberViewController?
    
    func didLoadView() {
        
        // идем в сеть за данными
        // обрабатываем (например сортируем)
        // отдаем на отображение
        
    }
}
