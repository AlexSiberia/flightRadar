//
//  TimeTablePresenter.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 10.03.2022.
//

import Foundation

class TimeTablePresenter: TimeTableInput {
    
    // MARK: - Output
    weak var output: TimeTableOutput?
    
    weak var view: AirportTimeTableViewController?
    
    // var timeTableService: TimeTableService
    
    func didLoadView() {

        // идем в сеть за данными
        // обрабатываем (например, сортируем)
        // отдаем на отображение
    }
}
