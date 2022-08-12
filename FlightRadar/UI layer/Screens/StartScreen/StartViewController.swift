//
//  StartViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 31.07.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    // MARK: - Output
    var output: StartScreenOutput?
    
    // MARK: Subviews
    
    private lazy var logoImageView: UIImageView = {
        let logoImage: UIImage? = UIImage(named: "SomeLogo")
        let logoImageView: UIImageView = UIImageView(image: logoImage)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleAspectFit
        
        return logoImageView
    }()

    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.output?.onFinish()
        }
    }
    
    
    // MARK: Private methods
    
    private func setupViews() {
        view.addSubviews(logoImageView)
    }

    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}


