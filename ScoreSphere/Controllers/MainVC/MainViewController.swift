//
//  MainViewController.swift
//  ScoreSphere
//
//  Created by macbook pro on 8.05.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: Variables
    var dataArray: [String] = []
    
    
    private lazy var newGameButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setTitle("New Game", for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 5.0
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(startNewGame), for: .touchUpInside)
        return button
    }()
    
    let gameTableView: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tv.separatorStyle = .none
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = "Games Bro"
        view.backgroundColor = .systemRed
        view.addSubview(newGameButton)
        view.addSubview(gameTableView)
        configureConstraints()
        
        gameTableView.dataSource = self
        gameTableView.delegate = self
    }
    
    // MARK: Configure Constraints
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
    
    // MARK: ACTİONS
    @objc func startNewGame() {
        let vc = NewGameViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController: NewGameVCDelegate {
    func didSaveText(_ text: String) {
        dataArray.append(text)
        gameTableView.reloadData()
    }
}
