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
    
    var shortcuts: [ShortCutModel] = [ShortCutModel]()
    var headers: [HeaderModel] = [HeaderModel]()
    
    func update(_ searchString: String) {
        self.searchString = searchString
        // обновляем скрин соглансо нового состояния
    }
    
    // MARK: - Private
    
    private func createShortcutsArray() {
        
        // TODO: дописать переходы на нужные экраны
        
        shortcuts.append(
            ShortCutModel(
                title: "Flight by route",
                logo: UIImage(systemName: "arrow.triangle.swap") ?? UIImage()
            )
        )
        shortcuts.append(
            ShortCutModel(
                title: "LIVE flight by airline",
                logo: UIImage(systemName: "airplane") ?? UIImage()
            )
        )
        shortcuts.append(
            ShortCutModel(
                title: "Airport by country",
                logo: UIImage(systemName: "mappin.and.ellipse") ?? UIImage(),
                didSelect: { [weak self] in
//                    self?.output?.didSelectAirportByCountry()
                }
            )
        )
    }
    
    private func createHeadersArray() {
        
        headers.append(HeaderModel(title: "SEARCH HISTORY"))
        headers.append(HeaderModel(title: "SHORTCUTS TO FIND"))
    }
}

extension SearchScreenByShortcutsPresenter: SearchScreenByShortcutsViewOutput {
    func didLoadView() {
        
        createHeadersArray()
        createShortcutsArray()
        
        let viewData = SearchScreenByShortcutsViewData(
            shortcuts: shortcuts,
            headers: headers
        )
        
        view?.showDataState(viewData)
    }
    
    func userDidSelect(shortcut: ShortCutModel) {
        shortcut.didSelect()
//        output?.didSelect(shortcut: shortcut)
    }
}
