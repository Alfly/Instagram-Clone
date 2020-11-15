//
//  IGFeedPostTableViewCell.swift
//  Instagram
//
//  Created by Alfly on 2020/11/14.
//  Copyright © 2020 Alfly. All rights reserved.
//

import UIKit

final class IGFeedPostTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        //congigure the cell
    }
    
}
