////
////  ResultOfSearchByFlightNumberViewController.swift
////  FlightRadar
////
////  Created by Alexander Kurbatov on 20.04.2022.
////
//
//import UIKit
//
//class ResultOfSearchByFlightNumberViewController: UIViewController {
//
//    // MARK: - Data
//
//    var presenter: ResultOfSearchByFlightNumberPresenter?
//
//    var flightNumbers: [FlightNumberModel] = [FlightNumberModel]()
//
//    // MARK: - Table objects
//
//    private lazy var tableDataSource = TableViewDataSource.make(for: flightNumbers)
//
//    // MARK: Subviews
//
//    private lazy var tableView: UITableView = {
//       let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(ResultOrSearchByFlightNumberFlightTableViewCell.self)
//
//        return tableView
//    }()
//
//    // MARK: - Life cycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////  Не помню что это за код
////        var a: Int?
////
////        // link https://stackoverflow.com/questions/24003291/ifdef-replacement-in-the-swift-language
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}


import UIKit

/// Подчиненный
class TransportsTableCellDelegate: CellActionDelegate<FlightNumberModel> {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
        
        super.init()
    }

    override func didSelect(model: FlightNumberModel) {
        let nextViewController = UIViewController()
        nextViewController.view.backgroundColor = UIColor.appColor(.backgroundColor)
        nextViewController.title = model.flightNumber
        let navigationController = UINavigationController(rootViewController: nextViewController)
        navigationController.modalPresentationStyle = .fullScreen

        viewController?.present(
            navigationController,
            animated: true
        )

        // Dismiss controller after 1 sec
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            navigationController.dismiss(animated: true)
        }
    }
}

class ResultOfSearchByFlightNumberViewController: UIViewController {
    
    // MARK: - Data
    
    var presenter: ResultOfSearchByFlightNumberPresenter?
    
    var transports: [FlightNumberModel] = [FlightNumberModel]()
    
    // MARK: - Table oblects

    private lazy var tableData: SectionedTableViewDataSource = SectionedTableViewDataSource(
        dataSources: [
            TableViewDataSource.make(for: transports),
            TableViewDataSource.make(for: [DividerModel()])
    ])
    
    private lazy var tableActions: TableViewDelegate = { [unowned self] in
        TableViewDelegate(
            models: transports,
            cellActionDelegate: TransportsTableCellDelegate(viewController: self)
        )
    }()
    
    
    // MARK: - Subviews
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.appColor(.backgroundColor)
        return tableView
    }()

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFlightNumberArray()
        view.backgroundColor = UIColor.appColor(.backgroundColor)
        setupSubviews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.indexPathsForSelectedRows?.forEach{ indexPath in
            tableView.deselectRow(at: indexPath, animated: animated)
        }
    }

    //MARK: - Tune subviews
    
    private func setupSubviews() {
        view.addSubview(tableView)
        tableView.delegate = tableActions
        tableView.dataSource = tableData
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ResultOrSearchByFlightNumberFlightTableViewCell.self)
        tableView.register(DividerTableViewCell.self)
    }

    //MARK: - Layout
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        
        ])
    }
   
    private func createFlightNumberArray() {
        
        let symbolConfig = UIImage.SymbolConfiguration(
            paletteColors: [
                UIColor.appColor(.iconColor)!,
                .systemYellow
            ]
        )
        let sizeConf = UIImage.SymbolConfiguration(scale: .large)
        let config = symbolConfig.applying(sizeConf)
        
        transports.append(
            FlightNumberModel(flightNumber: "Tram",
                              flightDescription: "Earth transport",
                              aviacompanyLogo: UIImage(systemName: "tram", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "Airplane",
                              flightDescription: "Air transport",
                              aviacompanyLogo: UIImage(systemName: "airplane", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "Ferry",
                              flightDescription: "River transport",
                              aviacompanyLogo: UIImage(systemName: "ferry", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "Bus",
                              flightDescription: "Sity transport",
                              aviacompanyLogo: UIImage(systemName: "bus", withConfiguration: config)!)
        )
        transports.append(
            FlightNumberModel(flightNumber: "Car",
                              flightDescription: "Sity transport",
                              aviacompanyLogo: UIImage(systemName: "car", withConfiguration: config)!)
        )
    }

}
