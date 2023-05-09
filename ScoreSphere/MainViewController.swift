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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemRed
        view.addSubview(newGameButton)
        
        setupNewGameButton()
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
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        newGameButton.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).inset(30)
            make.height.equalTo(50.0)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(30)
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
