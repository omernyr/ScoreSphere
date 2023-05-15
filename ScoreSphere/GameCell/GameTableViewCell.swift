//
//  GameTableViewCell.swift
//  ScoreSphere
//
//  Created by macbook pro on 10.05.2023.
//

import UIKit
import SnapKit

class GameTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    static let identifier = "GameTableViewCell"
    
    public static func register() -> UINib {
        UINib(nibName: "GameTableViewCell", bundle: nil)
    }
    
    @IBOutlet var backView: UIView!
    @IBOutlet var gamesTableView: UITableView!
    @IBOutlet var gameNameLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func designUI() {
        gamesTableView.dataSource = self
        gamesTableView.delegate = self
        gamesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        configureConstraints()
    }
    
    func configureConstraints() {
        //        minusButton.snp.makeConstraints { make in
        //            make.width
        //        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
}
