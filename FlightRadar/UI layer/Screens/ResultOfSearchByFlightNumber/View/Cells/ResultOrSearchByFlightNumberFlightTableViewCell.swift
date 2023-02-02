//
//  ResultOrSearchByFlightNumberTableViewCell.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 20.04.2022.
//

import UIKit

class ResultOrSearchByFlightNumberFlightTableViewCell: ConfigurableCell<FlightNumberPresentationModel> {
    
    // MARK: - Subviews
    
    // вроде NameSpace
    private enum LayoutConstants {
        
        // Common
        static let defaultOffset = 16.0
        static let smallDefaultOffset = 8.0
        
        // IconView
        static let iconViewDimension = 34.0
    }
    
    private let iconView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let flightNumberLabel: UILabel = {
        let flightNumberLabel = UILabel()
        flightNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        flightNumberLabel.numberOfLines = 0
        
        return flightNumberLabel
    }()
    
//    private lazy var heightConstraint: NSLayoutConstraint = {
//        let heightConstraint = flightNumberLabel.heightAnchor.constraint(equalToConstant: 44.0)
//        heightConstraint.priority = UILayoutPriority(249.0)
//
//        return heightConstraint
//    }()
    
    // MARK: - Initialization
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        
        contentView.backgroundColor = UIColor.appColor(.backgroundColor)
        
        contentView.addSubview(iconView)
        contentView.addSubview(flightNumberLabel)
        
        setupCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    override func configure(_ model: FlightNumberPresentationModel) {
        super.configure(model)
        
        iconView.image = model.aviacompanyLogo
        flightNumberLabel.text = model.flightNumber
        flightNumberLabel.font = UIFont.systemFont(ofSize: 18).bold()
        
//        heightConstraint.constant = flightNumberLabel.intrinsicContentSize.height
    }

    // MARK: - Private methods

    private func setupCellConstraints() {
        
        // IconView constraints
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: LayoutConstants.defaultOffset
            ),
            iconView.widthAnchor.constraint(
                equalToConstant: LayoutConstants.iconViewDimension
            ),
            iconView.heightAnchor.constraint(
                equalToConstant: LayoutConstants.iconViewDimension
            ),
            iconView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: LayoutConstants.smallDefaultOffset
            ),
            iconView.bottomAnchor.constraint(
                lessThanOrEqualTo: contentView.bottomAnchor,
                constant: -LayoutConstants.smallDefaultOffset
            ),
        ])
        
        // Label constraints
        NSLayoutConstraint.activate([
            flightNumberLabel.leadingAnchor.constraint(
                equalTo: iconView.trailingAnchor,
                constant: LayoutConstants.smallDefaultOffset
            ),
            flightNumberLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -LayoutConstants.defaultOffset
            ),
            flightNumberLabel.topAnchor.constraint(
                equalTo: iconView.topAnchor
            ),
            flightNumberLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -LayoutConstants.smallDefaultOffset
            ),
        ])
    }
}
