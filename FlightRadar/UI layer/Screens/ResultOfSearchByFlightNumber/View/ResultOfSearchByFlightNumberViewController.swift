//
//  ResultOfSearchByFlightNumberViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import UIKit

class ResultOfSearchByFlightNumberViewController: UIViewController {
    
    // MARK: - Data
    
    var presenter: ResultOfSearchByFlightNumberPresenter?
    
    var flightNumbers: [FlightNumberModel] = [FlightNumberModel]()
    
    // MARK: - Table objects
    
    private lazy var tableDataSource = TableViewDataSource.make(for: flightNumbers)
    
    // MARK: Subviews
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ResultOrSearchByFlightNumberTableViewCell.self)
        
        return tableView
    }()

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var a: Int?
        
        // link https://stackoverflow.com/questions/24003291/ifdef-replacement-in-the-swift-language
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
