//
//  ViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 30.06.2021.
//

import UIKit

class FirstViewController: BaseViewController {
    
    var presenter: FirstScreenPresenter
    
    // MARK: - Subviews
    
    lazy var label: UILabel = {
        
        let text1: String = "Find a "
        let text2: String = "Plane"
        let font1: UIFont = UIFont.systemFont(ofSize: 50).bold()
        let font2: UIFont = UIFont.systemFont(ofSize: 50).boldItalics()
        let shadow: NSShadow = NSShadow()
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        
        shadow.shadowColor = UIColor.appColor(.shadowColor)
        shadow.shadowBlurRadius = 5
        
        paragraphStyle.alignment = .center
        paragraphStyle.firstLineHeadIndent = 5.0
        
        let atributes1: [NSAttributedString.Key: Any] = [
            .font: font1,
            .shadow: shadow,
        ]
        
        let aributes2: [NSAttributedString.Key: Any] = [
            .font: font2,
            .shadow: shadow
        ]
        
        let atributedText1: NSMutableAttributedString = NSMutableAttributedString(string: text1, attributes: atributes1)
        let atributesText2: NSMutableAttributedString = NSMutableAttributedString(string: text2, attributes: aributes2)
        atributedText1.append(atributesText2)
        
        label = UILabel()
        label.attributedText = atributedText1
        label.textColor = UIColor.appColor(.textColor)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var searchByFlightNumberButton: UIButton = {
        
        searchByFlightNumberButton = UIButton(type: .system)
        searchByFlightNumberButton.setTitle("Search by flight number", for: .normal)
        searchByFlightNumberButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        searchByFlightNumberButton.setTitleColor(UIColor.appColor(.textColor), for: .normal)
        searchByFlightNumberButton.backgroundColor = UIColor.appColor(.backgroundColor)
        searchByFlightNumberButton.layer.cornerRadius = 10.0
        searchByFlightNumberButton.layer.borderWidth = 2
        searchByFlightNumberButton.layer.borderColor = UIColor.appColor(.textColor)?.cgColor
        searchByFlightNumberButton.translatesAutoresizingMaskIntoConstraints = false
        searchByFlightNumberButton.addTarget(
            self,
            action: #selector(searchByFlightNumberButtonAction),
            for: .touchUpInside)
      
        return searchByFlightNumberButton
    }()
    
   lazy var searchByAirportTimeTableButton: UIButton = {
        
        searchByAirportTimeTableButton = UIButton(type: .system)
        searchByAirportTimeTableButton.setTitle("Search by airport timetable", for: .normal)
        searchByAirportTimeTableButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        searchByAirportTimeTableButton.setTitleColor(
            UIColor.appColor(.textColor),
            for: .normal)
        searchByAirportTimeTableButton.backgroundColor = UIColor.appColor(.backgroundColor)
        searchByAirportTimeTableButton.layer.cornerRadius = 10.0
        searchByAirportTimeTableButton.layer.borderWidth = 2
        searchByAirportTimeTableButton.layer.borderColor = UIColor.appColor(.textColor)?.cgColor
        searchByAirportTimeTableButton.translatesAutoresizingMaskIntoConstraints = false
        searchByAirportTimeTableButton.addTarget(
            self,
            action: #selector(searchByAirportTimeTableButtonAction),
            for: .touchUpInside)
        
        return searchByAirportTimeTableButton
    }()
    
    init(presenter: FirstScreenPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        // Change button color
        navigationController?.navigationBar.tintColor = UIColor.appColor(.textColor)
//        navigationController?.navigationBar.barTintColor = UIColor.appColor(.textColor)
        // Change title color
        navigationController?.navigationBar.titleTextAttributes = [NSMutableAttributedString.Key.foregroundColor: UIColor.appColor(.textColor)!]
        
        
        
    }
    
    private func setupViews() {
        view.addSubviews(label, searchByFlightNumberButton, searchByAirportTimeTableButton)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            searchByFlightNumberButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            searchByFlightNumberButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100),
            searchByFlightNumberButton.widthAnchor.constraint(equalToConstant: 250),
            searchByFlightNumberButton.heightAnchor.constraint(equalToConstant: 50),
            
            searchByAirportTimeTableButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            searchByAirportTimeTableButton.topAnchor.constraint(
                equalTo: searchByFlightNumberButton.bottomAnchor,
                constant: 20),
            searchByAirportTimeTableButton.widthAnchor.constraint(equalToConstant: 250),
            searchByAirportTimeTableButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    @objc func searchByFlightNumberButtonAction(sender: UIButton!) {
//        navigationController?.pushViewController(
//            SearchByFlightNumberAssembly().create(),
//            animated: true)
        presenter.output?.didSelectSearchByFightNumber()
//        onSelectSearchByFlightNumber?()
        
    }
    
    @objc func searchByAirportTimeTableButtonAction(sender: UIButton!) {
//        navigationController?.pushViewController(
//            SearchByAirportTimeTablePresenterAssembly().create(),
//            animated: true)
        presenter.output?.didSelectSearchByAirportTimetable()
    }
    
    
}

