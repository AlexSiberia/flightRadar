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

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundColor = UIColor.appColor(.backgroundColor)
        view.backgroundColor = backgroundColor
        //        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        
        let logoImage = UIImage(named: "FirstScreenLogo")
                let logoView = UIImageView(image: logoImage)
                logoView.backgroundColor = .red
                logoView.contentMode = .scaleAspectFit
                logoView.clipsToBounds = true
                logoView.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(logoView)
                
                NSLayoutConstraint.activate([
                    logoView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                    logoView.widthAnchor.constraint(equalToConstant: 150),
                    logoView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
                    logoView.heightAnchor.constraint(equalToConstant: 150)
                ])
        
       
    }
    
    
}

