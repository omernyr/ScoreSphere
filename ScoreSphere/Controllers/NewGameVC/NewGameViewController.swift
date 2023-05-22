//
//  NewGameViewController.swift
//  ScoreSphere
//
//  Created by macbook pro on 8.05.2023.
//

import UIKit
import SnapKit

protocol NewGameViewControllerDelegate: class {
    func addNewGame(game: Game)
}

class NewGameViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: NewGameViewControllerDelegate?
    var viewModel: MainTableViewModel = MainTableViewModel()
    private let gameNameTextField = UITextField()
    private let setNewGame = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        title = "Games"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.app.fill"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(goToSettingPage))
        view.backgroundColor = .systemGreen
        view.addSubview(gameNameTextField)
        view.addSubview(setNewGame)
        designTextField()
        designButton()
    }
    
    private func designTextField() {
        gameNameTextField.delegate = self
        gameNameTextField.placeholder = "Please a void game name 🚀"
        gameNameTextField.layer.borderWidth = 1.0
        gameNameTextField.layer.cornerRadius = 5.0
        gameNameTextField.layer.borderColor = UIColor.black.cgColor
        gameNameTextField.backgroundColor = .secondarySystemBackground
        gameNameTextField.textColor = .black
        gameNameTextField.font = UIFont.systemFont(ofSize: 19.0, weight: .bold)
        gameNameTextField.textAlignment = .center
        configureConstraints()
    }
    
    private func designButton() {
        setNewGame.layer.borderWidth = 1.0
        setNewGame.layer.borderColor = UIColor.black.cgColor
        setNewGame.layer.cornerRadius = 5.0
        setNewGame.setTitle("Add", for: .normal)
        setNewGame.backgroundColor = .systemIndigo
        setNewGame.tintColor = .white
        let action = UIAction { _ in
            
            guard let gameName = self.gameNameTextField.text else { return }
            let newGame = Game(name: gameName)
            self.viewModel.game = newGame
            self.viewModel.appendElement()
//
//
//            self.delegate?.addNewGame(game: newGame)
//            self.dismiss(animated: true)
            
        }
        setNewGame.addAction(action, for: .touchUpInside)
    }
    
    private func configureConstraints() {
        gameNameTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(30.0)
            make.height.equalTo(50.0)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        setNewGame.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50.0)
            make.width.equalToSuperview().inset(20.0)
            make.bottom.equalToSuperview().inset(30.0)
        }
    }
    
    @objc func goToSettingPage() {
        let vc = UserViewController()
        present(vc, animated: true)
    }
    
}
