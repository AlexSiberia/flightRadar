//
//  SearchScreenByShortcutsHeaderTableViewCell.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 28.12.2022.
//

import UIKit

class SearchScreenByShortcutsHeaderTableViewCell: ConfigurableCell<HeaderModel> {
  
    private enum LayoutConstants {
        // Common
        static let defaultOffset = 16.0
        static let smallDefaultOffset = 8.0
        // IconView
        static let iconViewDimension = 34.0
    }
    
    // MARK: - Subviews
    
    private let headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerLabel.numberOfLines = 0
        
        return headerLabel
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
        contentView.addSubview(headerLabel)
        
        setupCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    override func configure(_ model: HeaderModel) {
        super.configure(model)
        
        headerLabel.text = model.title
        print(headerLabel.text!)
//        headerLabel.textColor = .black
        headerLabel.textColor = UIColor.appColor(.textColor)
        headerLabel.font = UIFont.systemFont(ofSize: 18).bold()
    }
    
    // MARK: - Private methods

    private func setupCellConstraints() {
        
        // Label constraints
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: LayoutConstants.smallDefaultOffset
            ),
//            headerLabel.trailingAnchor.constraint(
//                equalTo: contentView.trailingAnchor,
//                constant: -LayoutConstants.defaultOffset
//            ),
            headerLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: LayoutConstants.defaultOffset
            ),
            headerLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -LayoutConstants.smallDefaultOffset
            ),
//            headerLabel.heightAnchor.constraint(equalToConstant: LayoutConstants.iconViewDimension)
        ])
    }
}
