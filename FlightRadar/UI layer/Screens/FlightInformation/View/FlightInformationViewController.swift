//
//  FlightInformationViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 26.02.2022.
//

import UIKit

class FlightInformationViewController: BaseViewController {
    
    var presenter: FlightInformationPresenter?
    
    lazy var label: UILabel = {
        
        label = UILabel()
        label.text = "Info about plane"
        label.textColor = UIColor.appColor(.textColor)
        label.font = UIFont.systemFont(ofSize: 50).boldItalics()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    lazy var infoAboutPlane: UIButton = {
        infoAboutPlane = UIButton(type: .system)
        infoAboutPlane.setTitle("Show plane information", for: .normal)
        infoAboutPlane.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        infoAboutPlane.setTitleColor(UIColor.appColor(.textColor), for: .normal)
        infoAboutPlane.backgroundColor = UIColor.appColor(.backgroundColor)
        infoAboutPlane.layer.cornerRadius = 10.0
        infoAboutPlane.layer.borderWidth = 2.0
        infoAboutPlane.layer.borderColor = UIColor.appColor(.textColor)?.cgColor
        infoAboutPlane.translatesAutoresizingMaskIntoConstraints = false
        infoAboutPlane.addTarget(
            self,
            action: #selector(planeInformationButtonAction),
            for: .touchUpInside)

        return infoAboutPlane
    }()
    
    lazy var showPlaneOnMap: UIButton = {
        showPlaneOnMap = UIButton(type: .system)
        showPlaneOnMap.setTitle("Show plane on a map", for: .normal)
        showPlaneOnMap.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        showPlaneOnMap.setTitleColor(UIColor.appColor(.textColor), for: .normal)
        showPlaneOnMap.backgroundColor = UIColor.appColor(.backgroundColor)
        showPlaneOnMap.layer.cornerRadius = 10.0
        showPlaneOnMap.layer.borderWidth = 2.0
        showPlaneOnMap.layer.borderColor = UIColor.appColor(.textColor)?.cgColor
        showPlaneOnMap.translatesAutoresizingMaskIntoConstraints = false
        showPlaneOnMap.addTarget(
            self,
            action: #selector(planeOnMapButtonAction),
            for: .touchUpInside)

        return showPlaneOnMap
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()

        title = "Flight info"
    }
    
    private func setupSubviews() {
        view.addSubviews(label, infoAboutPlane, showPlaneOnMap)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            
            infoAboutPlane.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            infoAboutPlane.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            infoAboutPlane.widthAnchor.constraint(equalToConstant: 250),
            infoAboutPlane.heightAnchor.constraint(equalToConstant: 50),
            
            showPlaneOnMap.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            showPlaneOnMap.topAnchor.constraint(equalTo: infoAboutPlane.bottomAnchor, constant: 50),
            showPlaneOnMap.widthAnchor.constraint(equalToConstant: 250),
            showPlaneOnMap.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }
    
    @objc func planeInformationButtonAction(sender: UIButton) {
//        navigationController?.pushViewController(
//            PlaneInformationAssembly().create(),
//            animated: true)
        presenter?.output?.didSelectPlaneInfo()
    }
    
    @objc func planeOnMapButtonAction(sender: UIButton) {
//        navigationController?.pushViewController(
//            PlaneOnMapViewAssembly().create(),
//            animated: true)
        presenter?.output?.didSelectPlaneOnMap()
    }
    
}
