//
//  File.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 13.03.2022.
//

import Foundation

class FlightInformationPresenter: FlightInformationInput {
    
    //MARK: Output
    weak var output: FlightInformationOutput?
    
    weak var view: FlightInformationViewController?
    
    func didLoadView() {
        
        // идем в сеть за данными
        // обрабатываем (например сортируем)
        // отдаем на отображение
        
    }
}
