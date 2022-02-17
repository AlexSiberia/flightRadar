//
//  BaseViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 08.02.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func loadView() {
        setupViews()
    }
    
    private func setupViews() {
        view = UIView()
        let backgroundColor = UIColor.appColor(.backgroundColor)
        view.backgroundColor = backgroundColor
    }
}
