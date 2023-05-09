//
//  GameTableViewCell.swift
//  ScoreSphere
//
//  Created by macbook pro on 9.05.2023.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    let myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(myLabel)
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            myLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

}



