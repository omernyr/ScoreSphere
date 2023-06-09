//
//  MainVC + TableViewExtension.swift
//  ScoreSphere
//
//  Created by macbook pro on 11.05.2023.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.identifier, for: indexPath) as? GameTableViewCell else { return UITableViewCell() }
//        cell.designUI()
//        cell.backView.layer.borderWidth = 1.0
//        cell.backgroundColor = .systemRed
//        cell.backView.layer.borderColor = UIColor.systemIndigo.cgColor
//        cell.backView.backgroundColor = .systemGreen
//        cell.backView.layer.cornerRadius = 5.0
//        cell.gameNameLabel.text = "\(games[indexPath.row].name)"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 180.0
//    }
    
}
