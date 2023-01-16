//
//  SearchScreenByShortcutsShortcutTableViewCell.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 28.12.2022.
//

import UIKit

class SearchScreenByShortcutsShortcutTableViewCell: ConfigurableCell<ShortCutModel> {
    
    private enum LayoutConstants {
        
        // Common
        static let defaultOffset = 16.0
        static let smallDefaultOffset = 8.0
        
        // IconView
        static let iconViewDimension = 34.0
    }
    
    // MARK: - Subviews
    
    private let iconView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let shortcutLabel: UILabel = {
        let shortcutLabel = UILabel()
        shortcutLabel.translatesAutoresizingMaskIntoConstraints = false
        
        shortcutLabel.numberOfLines = 0
        
        return shortcutLabel
    }()
    
    // MARK: Initialization
    
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
        contentView.addSubview(shortcutLabel)
        
        setupCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    override func configure(_ model: ShortCutModel) {
        super.configure(model)
        
        iconView.image = model.logo
        shortcutLabel.text = model.title
        shortcutLabel.font = UIFont.systemFont(ofSize: 18).bold()
        
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
            shortcutLabel.leadingAnchor.constraint(
                equalTo: iconView.trailingAnchor,
                constant: LayoutConstants.smallDefaultOffset
            ),
            shortcutLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -LayoutConstants.defaultOffset
            ),
            shortcutLabel.topAnchor.constraint(
                equalTo: iconView.topAnchor
            ),
            shortcutLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -LayoutConstants.smallDefaultOffset
            ),
        ])
    }
}
