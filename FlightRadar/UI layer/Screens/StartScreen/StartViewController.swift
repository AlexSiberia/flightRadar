//
//  StartViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 31.07.2022.
//

import UIKit
import Lottie

class StartViewController: UIViewController {
    
    // MARK: - Output
    var output: StartScreenOutput?
    
    // MARK: Subviews
    
    private lazy var animationView: AnimationView = {
        
        var animationView = AnimationView(name: "Plane")
        if traitCollection.userInterfaceStyle == .light {
            animationView = AnimationView(name: "Plane_light")
        } else if traitCollection.userInterfaceStyle == .dark {
            animationView = AnimationView(name: "Plane_dark")
        }
        
//        switch traitCollection.userInterfaceStyle {
//        case .light:
//            animationView = AnimationView(name: "Plane")
//        case .dark:
//            // dark mode detected
//            animationView = AnimationView(name: "Plane_dark")
//        case .unspecified:
//            animationView = AnimationView(name: "Plane")
//        @unknown default:
//            animationView = AnimationView(name: "Plane")
//        }
    
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        return animationView
    }()

    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appColor(.backgroundColor)
        
        setupViews()
        setupConstraints()
        
        animationView.play()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Ходим в сеть
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.output?.onFinish()
        }
    }
    
    
    // MARK: Private methods
    
    private func setupViews() {
        view.addSubviews(animationView)
    }

    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

}


