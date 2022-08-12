//
//  PlaneOnMapViewPresenter.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 13.03.2022.
//

import Foundation

class PlaneOnMapViewPresenter: PlaneOnMapInput {
    
    //MARK: Output
    weak var output: PlaneOnMapOutput?
    
    weak var view: PlaneOnMapViewController?
    
    func didLoadView() {
        
        // идем в сеть за данными
        // обрабатываем (например сортируем)
        // отдаем на отображение
        
    }
}
