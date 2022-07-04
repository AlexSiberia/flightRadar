//
//  ResultOfSearchByFightNumberDividerTableViewCell.swift
//  FlightRadar
//
//  Created by Alexander Kurbatov on 02.07.2022.
//

import UIKit

final class DividerTableViewCell: ConfigurableCell<DividerModel> {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemBrown
        contentView.backgroundColor = .systemBrown
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure(_ model: DividerModel) {
        super.configure(model)
    }
    
}
