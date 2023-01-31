//
//  LiveFlightByAirlineViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 18.01.2023.
//

import UIKit

struct LiveFlightByAirlineViewSection {
    let header: HeaderModel
    let airlines: [AirlineModel]
}

struct LiveFlightByAirlineViewData {
    let sections: [LiveFlightByAirlineViewSection]
}

class LiveFlightByAirlineViewController: BaseViewController {
    
    fileprivate var viewData: LiveFlightByAirlineViewData = LiveFlightByAirlineViewData(
      sections: []
        )
    
    fileprivate var tableData: SectionedTableViewDataSource?
    
    var output: LiveFlightByAirlineViewOutput?
    
    fileprivate lazy var tableView: UITableView = { [unowned self] in
        let tableView = UITableView(
            frame: .zero,
            style: .plain
        )
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.appColor(.backgroundColor)
        tableView.tintColor = UIColor.appColor(.textColor)
        
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.delegate = self
        
        return tableView
    }()
   
    // MARK: - Subviews
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Airline name or ICAO code"
        searchController.searchBar.autocapitalizationType = .allCharacters
        return searchController
    }()
   
    
    // MARK: Initialization
    
    init(
        output: LiveFlightByAirlineViewOutput
    ) {
        self.output = output
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
        
        output?.didLoadView()
    }
    
    private func setupView() {
//        title = "LIVE flight by airline"
        
        // Change button color
        navigationController?.navigationBar.tintColor = UIColor.appColor(.textColor)
//        // Hide back button
//        navigationItem.hidesBackButton = true
        // Change title color
        navigationController?.navigationBar.titleTextAttributes = [
            NSMutableAttributedString.Key.foregroundColor: UIColor.appColor(.textColor)!
        ]
        
        setupNavigationBar()
    }
    
    private func setupSubviews() {
        setupTableView()
    }
    
    private func setupTableView() {
        
        view.addSubview(tableView)
        tableView.register(AirlinesTableViewCell.self)
        tableView.register(HeaderTableViewCell.self)
    }
    
    private func setupSearchField() {

    }
    
    private func setupNavigationBar() {
          navigationItem.searchController = searchController
      }
    
    // MARK: Constraints
    
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

extension LiveFlightByAirlineViewController: LiveFlightByAirlineViewInput {
    
    func showLoadingState() {
        tableView.isHidden = true
        //        loadingLabel.isHidden = false
    }
    
    func showDataState(_ data: LiveFlightByAirlineViewData) {
        tableView.isHidden = false
        //        loadingLabel.isHidden = true
        
        viewData = data
        
        var dataSources: [UITableViewDataSource] = []
        
        for section in viewData.sections {
            let header = TableViewDataSource.make(for: [section.header])
            let airlines = TableViewDataSource.make(for: section.airlines)
            
            dataSources.append(header)
            dataSources.append(airlines)
        }
        
        let dataSource = SectionedTableViewDataSource(dataSources: dataSources)
        tableView.dataSource = dataSource
        tableData = dataSource
        
        tableView.reloadData()
    }
}

extension LiveFlightByAirlineViewController {
    func searchFor(_ searchText: String) {
        
    }
}

extension LiveFlightByAirlineViewController: UISearchBarDelegate {
    func searchBar(
        _ searchBar: UISearchBar,
        textDidChange searchText: String
    ) {
      searchFor(searchText)
    }
    
}

//extension LiveFlightByAirlineViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        searchController.showsSearchResultsController = true
//    }
//}

// MARK: - UISearchResult Updating and UISearchControllerDelegate  Extension
  extension LiveFlightByAirlineViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
    
    }
 }

extension LiveFlightByAirlineViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
            if indexPath.section % 2 == 0 {
                return
            }
            if indexPath.section == 3 {
                let airlines = viewData.sections[1]
                    .airlines[indexPath.row]
                    output?.userDidSelect(airlines: airlines)
            }
            
        }
}
