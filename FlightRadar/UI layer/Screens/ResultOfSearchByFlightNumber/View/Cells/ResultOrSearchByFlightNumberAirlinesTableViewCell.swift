//
//  ResultOrSearchByFlightNumberAirlinesTableViewCell.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 14.07.2022.
//

import UIKit

class ResultOrSearchByFlightNumberAirlinesTableViewCell: ConfigurableCell<AirlineModel> {
    
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
    
    private let airlineLabel: UILabel = {
        let airlineLabel = UILabel()
        airlineLabel.translatesAutoresizingMaskIntoConstraints = false
        
        airlineLabel.numberOfLines = 0
        
        return airlineLabel
    }()
    
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
        contentView.addSubview(airlineLabel)
        
        setupCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    override func configure(_ model: AirlineModel) {
        super.configure(model)
        
        iconView.image = model.aviacompanyLogo
        airlineLabel.text = model.airlineBrand
        airlineLabel.font = UIFont.systemFont(ofSize: 18).bold()
        
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
            airlineLabel.leadingAnchor.constraint(
                equalTo: iconView.trailingAnchor,
                constant: LayoutConstants.smallDefaultOffset
            ),
            airlineLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -LayoutConstants.defaultOffset
            ),
            airlineLabel.topAnchor.constraint(
                equalTo: iconView.topAnchor
            ),
            airlineLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -LayoutConstants.smallDefaultOffset
            ),
        ])
    }
}
