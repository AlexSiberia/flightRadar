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
    
}

extension SearchScreenPresenter: SearchViewOutput {
    
    func didLoadView() {
        
        // идем в сеть за результами поиска
        // обрабатываем (например сортируем)
        // отдаем на отображение
        
    }
}
