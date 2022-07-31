//
//  Configutable.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 02.07.2022.
//

import UIKit

protocol ConfigurableView: AnyObject {
    associatedtype Model
    
    func configure(_ model: Model)
}

class ConfigurableCell<Model>: UITableViewCell, ConfigurableView {
    func configure(_ model: Model) {}
}

class ConfigurableCollectionCell<Model>: UICollectionViewCell, ConfigurableView {
    func configure(_ model: Model) {}
}
