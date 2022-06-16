//
//  AirportTimeTableViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 26.02.2022.
//

import UIKit

class AirportTimeTableViewController: BaseViewController {
    
    var presenter: TimeTablePresenter?
    
    lazy var label: UILabel = {
        
        label = UILabel()
        label.text = "Airport Name"
        label.textColor = UIColor.appColor(.textColor)
        label.font = UIFont.systemFont(ofSize: 50).boldItalics()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var showFlightInfo: UIButton = {
        showFlightInfo = UIButton(type: .system)
        showFlightInfo.setTitle("Search", for: .normal)
        showFlightInfo.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        showFlightInfo.setTitleColor(UIColor.appColor(.textColor), for: .normal)
        showFlightInfo.backgroundColor = UIColor.appColor(.backgroundColor)
        showFlightInfo.layer.cornerRadius = 10.0
        showFlightInfo.layer.borderWidth = 2.0
        showFlightInfo.layer.borderColor = UIColor.appColor(.textColor)?.cgColor
        showFlightInfo.translatesAutoresizingMaskIntoConstraints = false
        showFlightInfo.addTarget(
            self,
            action: #selector(flightInformationButtonAction),
            for: .touchUpInside)

        return showFlightInfo
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()

        title = "Airport timetable"
        
        presenter?.didLoadView()
    }
    
    private func setupSubviews() {
        view.addSubviews(label, showFlightInfo)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            
            showFlightInfo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            showFlightInfo.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            showFlightInfo.widthAnchor.constraint(equalToConstant: 250),
            showFlightInfo.heightAnchor.constraint(equalToConstant: 50),
            
            
        ])
        
    }
    
    // MARK: - Actions
    
//    func handleUpdatedTimeTable(_ timeTable: TimeTable) {
//        title = timeTable.title
//        button.title = timeTable.action
//    }
    
    @objc func flightInformationButtonAction(sender: UIButton) {
        navigationController?.pushViewController(
            FlightInformationViewController(),
            animated: true)
    }
   

}
