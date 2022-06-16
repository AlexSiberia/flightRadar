//
//  ResultOrSearchByFlightNumberTableViewCell.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import UIKit

class ResultOrSearchByFlightNumberTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    private lazy var flightNumberLabel: UILabel = {
        let flightNumberLabel = UILabel()
        flightNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return flightNumberLabel
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(flightNumberLabel)
        
        setupCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func updateDataSource(with model: FlightNumberModel) {
        configure(flightNumber: model.flightNumber)
    }
    
 
    // MARK: - Private methods

    private func setupCellConstraints() {
        
        NSLayoutConstraint.activate([
            flightNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            flightNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            flightNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            flightNumberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    private func configure(flightNumber: String) {
        flightNumberLabel.text = flightNumber
    }

}
