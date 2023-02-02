//
//  SearchScreenByShortcutsController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 26.12.2022.
//

import UIKit

struct SearchScreenByShortcutsViewSection {
    let header: HeaderModel
    let shortcuts: [ShortCutModel]
}

struct SearchScreenByShortcutsViewData {
    let sections: [SearchScreenByShortcutsViewSection]
}

class SearchScreenByShortcutsViewController: UIViewController {
    
    fileprivate var viewData: SearchScreenByShortcutsViewData = SearchScreenByShortcutsViewData(
      sections: []
        )
    
    fileprivate var tableData: SectionedTableViewDataSource?
    
    var output: SearchScreenByShortcutsViewOutput?
    
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
    
    init(output: SearchScreenByShortcutsViewOutput) {
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
        
        viewData = data
        
        var dataSources: [UITableViewDataSource] = []
        
        for section in viewData.sections {
            let header = TableViewDataSource.make(for: [section.header])
            let shortcuts = TableViewDataSource.make(for: section.shortcuts)
            
            dataSources.append(header)
            dataSources.append(shortcuts)
        }
        
        let dataSource = SectionedTableViewDataSource(dataSources: dataSources)
        tableView.dataSource = dataSource
        tableData = dataSource
        
        tableView.reloadData()
    }
}

extension SearchScreenByShortcutsViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
            if indexPath.section % 2 == 0 {
                return
            }
            if indexPath.section == 3 {
                let shortcut = viewData.sections[1]
                    .shortcuts[indexPath.row]
                    output?.userDidSelect(shortcut: shortcut)
            }
            
        }
}
