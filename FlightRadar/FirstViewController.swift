//
//  ViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 30.06.2021.
//

import UIKit

enum FirstScreenColor {
    case backgroundColor
    case textColor
}

extension UIColor {
    static func appColor(_ name: FirstScreenColor) -> UIColor? {
        switch name {
        case .backgroundColor:
            return UIColor(named: "BackgroundColor")
        case .textColor:
            return UIColor(named: "TextColor")
        }
    }
}

class FirstViewController: UIViewController {
    
    var label: UILabel!
    var searchByFlightNumberButton: UIButton!
    var searchByAirportTimeTableButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundColor = UIColor.appColor(.backgroundColor)
        view.backgroundColor = backgroundColor
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.text = "Find a Plane"
        label.textColor = UIColor.appColor(.textColor)
        label.font = UIFont.systemFont(ofSize: 50.0)
        label.font = UIFont.boldSystemFont(ofSize: 50.0)
        label.font = UIFont.italicSystemFont(ofSize: 50.0)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 50.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        view.addSubview(label)
        
        searchByFlightNumberButton = UIButton()
        searchByFlightNumberButton.setTitle("Search by flight number", for: .normal)
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
        view.addSubview(searchByFlightNumberButton)
        
        searchByAirportTimeTableButton = UIButton()
        searchByAirportTimeTableButton.setTitle("Search by airport timetable", for: .normal)
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
        view.addSubview(searchByAirportTimeTableButton)
        
        // Change button color
        navigationController?.navigationBar.tintColor = UIColor.appColor(.textColor)
//        navigationController?.navigationBar.barTintColor = UIColor.appColor(.textColor)
        // Change title color
        navigationController?.navigationBar.titleTextAttributes = [NSMutableAttributedString.Key.foregroundColor: UIColor.appColor(.textColor)!]
        
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
        
        
        
        
        
        
        //        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        //        let logoImage = UIImage(named: "FirstScreenLogo")
        //                let logoView = UIImageView(image: logoImage)
        //                logoView.backgroundColor = .red
        //                logoView.contentMode = .scaleAspectFit
        //                logoView.clipsToBounds = true
        //                logoView.translatesAutoresizingMaskIntoConstraints = false
        //                view.addSubview(logoView)
        //
        //                NSLayoutConstraint.activate([
        //                    logoView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        //                    logoView.widthAnchor.constraint(equalToConstant: 150),
        //                    logoView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        //                    logoView.heightAnchor.constraint(equalToConstant: 150)
        //                ])
        
        
        
    }
    
    @objc func searchByFlightNumberButtonAction(sender: UIButton!) {
        navigationController?.pushViewController(
            SearchByFlightNumberViewController(),
            animated: true)
    }
    
    @objc func searchByAirportTimeTableButtonAction(sender: UIButton!) {
        navigationController?.pushViewController(
            SearchByAirportTimeTableViewController(),
            animated: true)
    }
    
    
}

