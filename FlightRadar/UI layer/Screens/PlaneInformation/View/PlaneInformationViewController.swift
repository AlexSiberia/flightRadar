//
//  InfoPlaneViewController.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 26.02.2022.
//

import UIKit

class  PlaneInformationViewController: BaseViewController {
    
    var presenter: PlaneInformationPresenter
    
    init(presenter: PlaneInformationPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Plane info"
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
