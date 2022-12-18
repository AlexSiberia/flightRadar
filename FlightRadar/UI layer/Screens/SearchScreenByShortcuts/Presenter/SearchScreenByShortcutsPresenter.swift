//
//  SearchScreenByShortcutsPresenter.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 26.12.2022.
//

import UIKit

class SearchScreenByShortcutsPresenter: SearchScreenByShortcutsScreenInput {
    
    weak var output: SearchScreenByShortcutsScreenOutput?
    
    var searchString: String?
    
    weak var view: SearchScreenByShortcutsViewInput?
    
    private lazy var viewData: SearchScreenByShortcutsViewData = createViewData()
    
    func update(_ searchString: String) {
        self.searchString = searchString
        // обновляем скрин соглансо нового состояния
    }
    
    // MARK: - Private
    
    private func createViewData() -> SearchScreenByShortcutsViewData {
        var shortcuts: [ShortCutModel] = []
        
        shortcuts.append(
            ShortCutModel(
                title: "Flight by route",
                logo: UIImage(systemName: "arrow.triangle.swap") ?? UIImage(),
                action: { [weak self] in
                    
                    self?.output?.didSelectFlightByRoute()
                    
            })
        )
        shortcuts.append(
            ShortCutModel(
                title: "LIVE flight by airline",
                logo: UIImage(systemName: "airplane") ?? UIImage(),
                action: { [weak self] in
                    
                    self?.output?.didSelectLiveFlightByAirline()
                    
                })
        )
        
        shortcuts.append(
            ShortCutModel(
                title: "Airport by country",
                logo: UIImage(systemName: "mappin.and.ellipse") ?? UIImage(),
                action: { [weak self] in
                    
                    self?.output?.didSelectFlightByAirportByCountry()
                    
                })
        )
        
        
        let section0: SearchScreenByShortcutsViewSection = SearchScreenByShortcutsViewSection(
            header: HeaderModel(title: "SEARCH HISTORY"),
            shortcuts: []
        )
        let section1: SearchScreenByShortcutsViewSection = SearchScreenByShortcutsViewSection(
            header: HeaderModel(title: "SHORTCUTS TO FIND"),
            shortcuts: shortcuts
        )
        
        let viewData: SearchScreenByShortcutsViewData = SearchScreenByShortcutsViewData(sections: [section0, section1])
        
        return viewData
    }
}



extension SearchScreenByShortcutsPresenter: SearchScreenByShortcutsViewOutput {
    func didLoadView() {
        
        view?.showDataState(viewData)
    }
    
    func userDidSelect(shortcut: ShortCutModel) {
        shortcut.action()
    }
}
