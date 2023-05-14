//
//  GameTableViewCell.swift
//  ScoreSphere
//
//  Created by macbook pro on 10.05.2023.
//

import UIKit
import SnapKit

class GameTableViewCell: UITableViewCell {
    
    static let identifier = "GameTableViewCell"
    
    public static func register() -> UINib {
        UINib(nibName: "GameTableViewCell", bundle: nil)
    }

    @IBOutlet var backView: UIView!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var pointLabel: UILabel!
    @IBOutlet var gameNameLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func designUI() {
//        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        minusButton.layer.cornerRadius = 35.0
        minusButton.backgroundColor = .systemPurple
        minusButton.tintColor = .white
        
//        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.layer.cornerRadius = 35.0
        plusButton.backgroundColor = .systemPurple
        plusButton.tintColor = .white
        
        configureConstraints()
    }
    
    func configureConstraints() {
//        minusButton.snp.makeConstraints { make in
//            make.width
//        }
    }
}
