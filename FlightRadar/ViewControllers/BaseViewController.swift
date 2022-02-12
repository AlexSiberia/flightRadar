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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
