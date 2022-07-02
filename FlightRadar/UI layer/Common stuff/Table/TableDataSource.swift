//
//  TableDataSource.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 02.05.2022.
//

import UIKit

class TableViewDataSource<Model, Cell: ConfigurableCell<Model>>: NSObject, UITableViewDataSource {
    
    private let models: [Model]
    
    init(
        models: [Model]
    ) {
        self.models = models
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        models.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell: Cell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(model)
        return cell
    }
}

extension TableViewDataSource where Model == DividerModel, Cell == DividerTableViewCell {
    
    static func make(
        for dividers: [DividerModel]
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: dividers
        )
    }
}
