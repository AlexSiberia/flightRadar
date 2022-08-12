//
//  FirstScreenPresenter.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 04.08.2022.
//

import Foundation

class FirstScreenPresenter: FirstScreenInput {
    
    // MARK: - Output
    weak var output: FirstScreenOutput?
    
    weak var view: FirstViewController?
    
    func didLoadView() {
        
        // идем в сеть за данными
        // обрабатываем (например сортируем)
        // отдаем на отображение
        
    }
}
