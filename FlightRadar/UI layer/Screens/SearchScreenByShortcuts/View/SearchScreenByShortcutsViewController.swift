//
//  SearchScreenByShortcutsController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 26.12.2022.
//

import UIKit

struct SearchScreenByShortcutsViewData {
    let shortcuts: [ShortCutModel]
    let headers: [HeaderModel]
}

//struct SearchScreenByShortcutsViewSection {
//    let shortcuts: [ShortCutModel]
//    let header: HeaderModel
//}
//
//struct SearchScreenByShortcutsViewData {
//    let sections: [SearchScreenByShortcutsViewSection]
//}

class SearchScreenByShortcutsViewController: UIViewController {
    
    fileprivate var viewData: SearchScreenByShortcutsViewData = SearchScreenByShortcutsViewData(
        shortcuts: [],
        headers: []
    )
    
    fileprivate var tableData: SectionedTableViewDataSource?
    
    var presenter: SearchScreenByShortcutsPresenter?
    
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
    
    init(presenter: SearchScreenByShortcutsPresenter) {
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
        
        tableView.register(SearchScreenByShortcutsShortcutTableViewCell.self)
        tableView.register(SearchScreenByShortcutsHeaderTableViewCell.self)
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

extension SearchScreenByShortcutsViewController: SearchScreenByShortcutsViewInput {
    
    func showLoadingState() {
        tableView.isHidden = true
        //        loadingLabel.isHidden = false
    }
    
    func showDataState(_ data: SearchScreenByShortcutsViewData) {
        tableView.isHidden = false
        //        loadingLabel.isHidden = true
        
        guard data.headers.count >= 2 else {
            fatalError()
        }
        
        viewData = data
        
        // TODO: убрать
        
        let data_section0 = [viewData.headers.first].compactMap { $0 }
        let data_section2 = [viewData.headers.last].compactMap { $0 }
        let section0 = TableViewDataSource.make(for: data_section0)
        let section2 = TableViewDataSource.make(for: data_section2)
        let section3 = TableViewDataSource.make(for: viewData.shortcuts)
        
        let dataSource = SectionedTableViewDataSource(dataSources: [
            section0,
            section2,
            section3,
        ])
        tableView.dataSource = dataSource
        tableData = dataSource
        
        tableView.reloadData()
    }
}

extension SearchScreenByShortcutsViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
            if indexPath.section == 2 {
                
                let shortcut = viewData.shortcuts[indexPath.row]
                
                presenter?.userDidSelect(shortcut: shortcut)
            }
        }
}
