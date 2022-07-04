//
//  TableViewDelegate.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 02.07.2022.
//

import UIKit

class CellActionDelegate<Model> {
    
    func didSelect(model: Model) {}
}

/// Generic реализация протокола UITableViewDelegate для простых таблиц
/// Начальник в паттерне Delegate
class TableViewDelegate<Model>: NSObject, UITableViewDelegate {
    
    private let models: [Model]
    private var cellActionDelegate: CellActionDelegate<Model> // Подчиненный
    
    init(
        models: [Model],
        cellActionDelegate: CellActionDelegate<Model>
    ) {
        self.models = models
        self.cellActionDelegate = cellActionDelegate
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let model = models[indexPath.row]
        cellActionDelegate.didSelect(model: model)
    }
}
