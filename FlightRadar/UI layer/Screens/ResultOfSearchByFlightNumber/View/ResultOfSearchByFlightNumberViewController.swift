//
//  ResultOfSearchByFlightNumberViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import UIKit

struct ResultOfSearchByFlightNumberViewData {
    let airlines: [AirlineModel]
    let flights: [FlightNumberModel]
}

class ResultOfSearchByFlightNumberViewController: UIViewController {
    
    fileprivate var viewData: ResultOfSearchByFlightNumberViewData = ResultOfSearchByFlightNumberViewData(airlines: [], flights: [])
    
    var presenter: ResultOfSearchByFlightNumberViewOutput

    fileprivate var tableData: SectionedTableViewDataSource?
    
//    private lazy var tableActions: TableViewDelegate = { [unowned self] in
//        TableViewDelegate(
//            models: transports,
//            cellActionDelegate: TableViewDelegate(viewController: self)
//        )
//    }()
    
    
    // MARK: - Subviews
    
    fileprivate lazy var loadingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Загрузка..."
        
        return label
    }()
    
    fileprivate lazy var tableView: UITableView = { [unowned self] in
        let tableView = UITableView(
            frame: .zero,
            style: .plain
        )
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.appColor(.backgroundColor)
        
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.delegate = self
        
        return tableView
    }()

    
    init(presenter: ResultOfSearchByFlightNumberPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupSubviews()
        setupConstraints()
        
        presenter.didLoadView()
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
        setupLoadingView()
        setupTableView()
    }
    
    private func setupLoadingView() {
        view.addSubview(loadingLabel)
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.register(ResultOrSearchByFlightNumberAirlinesTableViewCell.self)
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
    
    func showLoadingState() {
        tableView.isHidden = true
        loadingLabel.isHidden = false
    }
    
    func showDataState(_ data: ResultOfSearchByFlightNumberViewData) {
        tableView.isHidden = false
        loadingLabel.isHidden = true
        
        viewData = data
        
        let section0 = TableViewDataSource.make(for: viewData.airlines)
        let section1 = TableViewDataSource.make(for: [ DividerModel() ])
        let section2 = TableViewDataSource.make(for: viewData.flights)
        let section3 = TableViewDataSource.make(for: [ DividerModel() ])
        
        let dataSource = SectionedTableViewDataSource(dataSources: [
            section0,
            section1,
            section2,
            section3,
        ])
        tableView.dataSource = dataSource
        tableData = dataSource

        tableView.reloadData()
    }
}

extension ResultOfSearchByFlightNumberViewController: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        if indexPath.section == 0 {
            let airline = viewData.airlines[indexPath.row]
            presenter.userDidSelect(airline: airline)
        } else if indexPath.section == 2 {
            let flight = viewData.flights[indexPath.row]
            presenter.userDidSelect(flight: flight)
        }
    }
}
