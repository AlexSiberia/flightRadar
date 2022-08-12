//
//  PlaneInformationPresenter.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 10.03.2022.
//

import Foundation

class PlaneInformationPresenter: PlaneInformationInput {
    
    //MARK: Output
    weak var output: PlaneInformationOutput?
    
    weak var view: PlaneInformationViewController?
    
    func didLoadView() {
        
        // идем в сеть за данными
        // обрабатываем (например сортируем)
        // отдаем на отображение
        
    }
}
