//
//  GameTableViewCell.swift
//  ScoreSphere
//
//  Created by macbook pro on 10.05.2023.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    static let identifier = "GameTableViewCell"
    
    public static func register() -> UINib {
        UINib(nibName: "GameTableViewCell", bundle: nil)
    }

    @IBOutlet var backView: UIView!
    @IBOutlet var firstL: UILabel!
    @IBOutlet var secondL: UILabel!
    @IBOutlet var thirdL: UILabel!
    @IBOutlet var gameNameLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
}
