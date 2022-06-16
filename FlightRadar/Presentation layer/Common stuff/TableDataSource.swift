//
//  TableDataSource.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 02.05.2022.
//

import UIKit

class TableViewDataSource<Model, Cell: UITableViewCell>: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    
    typealias CellConfigurator = (Model, Cell) -> Void
    
    private let models: [Model]
    private let cellConfigurator: CellConfigurator
    
    // MARK: - Initialization
    
    init(
        models: [Model],
        cellConfigurator: @escaping CellConfigurator = { model, cell in }
    ) {
        self.models = models
        self.cellConfigurator = cellConfigurator
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return models.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell: Cell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cellConfigurator(model, cell)
        return cell
    }
}
