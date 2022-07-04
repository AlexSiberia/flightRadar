//
//  ResultOrSearchByFlightNumberTableViewCell.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import UIKit

class ResultOrSearchByFlightNumberFlightTableViewCell: ConfigurableCell<FlightNumberModel> {
    
    // MARK: - Subviews
    
    private let flightNumberLabel: UILabel = {
        let flightNumberLabel = UILabel()
        flightNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return flightNumberLabel
    }()
    
    private lazy var heightConstraint: NSLayoutConstraint = {
        let heightConstraint = flightNumberLabel.heightAnchor.constraint(equalToConstant: 44.0)
        heightConstraint.priority = UILayoutPriority(249.0)
        
        return heightConstraint
    }()
    
    // MARK: - Initialization
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        
        contentView.addSubview(flightNumberLabel)
        
        setupCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    override func configure(_ model: FlightNumberModel) {
        super.configure(model)
        
        flightNumberLabel.text = model.flightNumber
        
        heightConstraint.constant = flightNumberLabel.intrinsicContentSize.height
    }

    // MARK: - Private methods

    private func setupCellConstraints() {
        NSLayoutConstraint.activate([
            flightNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            flightNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            flightNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            heightConstraint,
            flightNumberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
