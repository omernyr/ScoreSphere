//
//  MainViewController.swift
//  ScoreSphere
//
//  Created by macbook pro on 8.05.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let newGameButton = UIButton()
    private let gameTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        title = "Games"
        view.backgroundColor = .systemRed
        view.addSubview(newGameButton)
        view.addSubview(gameTableView)
        configureConstraints()
        setupNewGameButton()
        setupGameTableView()
    }
    
    private func setupNewGameButton() {
        newGameButton.setImage(UIImage(systemName: "plus"), for: .normal)
        newGameButton.setTitle("New Game", for: .normal)
        newGameButton.layer.borderWidth = 1.0
        newGameButton.layer.cornerRadius = 5.0
        newGameButton.layer.borderColor = UIColor.black.cgColor
        newGameButton.backgroundColor = .secondarySystemBackground
        newGameButton.setTitleColor(.black, for: .normal)
        newGameButton.tintColor = .black
        newGameButton.addTarget(self, action: #selector(startNewGame), for: .touchUpInside)
    }
    
    private func setupGameTableView() {
        gameTableView.register(GameTableViewCell.self, forCellReuseIdentifier: "GameTableViewCell")
        gameTableView.dataSource = self
        gameTableView.delegate = self
        gameTableView.backgroundColor = .clear
        gameTableView.layer.borderWidth = 1.0
        gameTableView.layer.borderColor = UIColor.black.cgColor
        gameTableView.layer.cornerRadius = 5.0
    }
    
    private func configureConstraints() {
        newGameButton.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).inset(30)
            make.height.equalTo(50.0)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(30)
        }
        
        gameTableView.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(90)
            make.bottom.equalTo(newGameButton.snp.top).offset(-30)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - ACTİONS
    @objc func startNewGame() {
        let vc = NewGameViewController()
        // present(vc, animated: true)
        
        // let navigationController = UINavigationController(rootViewController: vc)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    // lalo
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell", for: indexPath) as? GameTableViewCell else { return UITableViewCell() }
        cell.myLabel.text = "my game is \(indexPath.row)."
        return cell
    }
}
