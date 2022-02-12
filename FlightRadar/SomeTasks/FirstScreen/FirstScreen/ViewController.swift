//
//  ViewController.swift
//  FirstScreen
//
//  Created by Alexander Kurbatov on 27.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!
    var searchByFlightNumberButton: UIButton!
    var searchByAirportTimeTableButton: UIButton!
    let 1: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        label = UILabel(frame: CGRect(x: 70, y: 150, width: 300, height: 50))
        label.text = "Find a Plane"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 50.0)
      
//        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        view.addSubview(label)
        label.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin]
        
        
        searchByFlightNumberButton = UIButton(frame: CGRect(x: 70, y: 300, width: 300, height: 50))
//        searchByFlightNumberButton.frame = UIRectFrame(CGRect(x: 70, y: 300, width: 300, height: 50))
        searchByFlightNumberButton.setTitle("Search by flight number", for: .normal)
        searchByFlightNumberButton.setTitleColor(.black, for: .normal)
        searchByFlightNumberButton.backgroundColor = .yellow
        searchByFlightNumberButton.layer.cornerRadius = 10.0
        searchByFlightNumberButton.layer.borderWidth = 2
        searchByFlightNumberButton.layer.borderColor = UIColor(named: "black")?.cgColor
        view.addSubview(searchByFlightNumberButton)
        searchByFlightNumberButton.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin]
        
        
        searchByAirportTimeTableButton = UIButton(frame: CGRect(x: 70, y: 400, width: 300, height: 50))
        searchByAirportTimeTableButton.setTitle("Search by airport timetable", for: .normal)
        searchByAirportTimeTableButton.setTitleColor(.black, for: .normal)
        searchByAirportTimeTableButton.backgroundColor = .yellow
        searchByAirportTimeTableButton.layer.cornerRadius = 10.0
        searchByAirportTimeTableButton.layer.borderWidth = 2
        searchByAirportTimeTableButton.layer.borderColor = UIColor(named: "black")?.cgColor
        view.addSubview(searchByAirportTimeTableButton)
        searchByAirportTimeTableButton.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin]
        
    }

    


}

