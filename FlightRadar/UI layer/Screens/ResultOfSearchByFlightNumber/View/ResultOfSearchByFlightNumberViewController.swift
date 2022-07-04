//
//  ResultOfSearchByFlightNumberViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import UIKit

class ResultOfSearchByFlightNumberViewController: UIViewController {
    
    var presenter: ResultOfSearchByFlightNumberViewOutput?

    fileprivate var tableData: SectionedTableViewDataSource?
    
//    private lazy var tableActions: TableViewDelegate = { [unowned self] in
//        TableViewDelegate(
//            models: transports,
//            cellActionDelegate: TableViewDelegate(viewController: self)
//        )
//    }()
    
    
    // MARK: - Subviews
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(
            frame: .zero,
            style: .plain
        )
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.appColor(.backgroundColor)
        
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        return tableView
    }()

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupSubviews()
        setupConstraints()
        
        presenter?.didLoadView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.indexPathsForSelectedRows?.forEach{ indexPath in
            tableView.deselectRow(at: indexPath, animated: animated)
        }
    }

    // MARK: - Tune subviews
    
    private func setupView() {
        view.backgroundColor = UIColor.appColor(.backgroundColor)
        title = "Поиск"
    }
    
    private func setupSubviews() {
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.register(ResultOrSearchByFlightNumberFlightTableViewCell.self)
        tableView.register(DividerTableViewCell.self)
    }

    // MARK: - Layout
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
        ])
    }
}

extension ResultOfSearchByFlightNumberViewController: ResultOfSearchByFlightNumberViewInput {
    
    func update(with data: [FlightNumberModel]) {
        let dataSource = SectionedTableViewDataSource(
            dataSources: [
                TableViewDataSource.make(for: data),
                TableViewDataSource.make(for: [DividerModel()])
        ])
        tableView.dataSource = dataSource
        tableData = dataSource

        tableView.reloadData()
    }
}
