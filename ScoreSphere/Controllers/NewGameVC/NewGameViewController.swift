//
//  NewGameViewController.swift
//  ScoreSphere
//
//  Created by macbook pro on 8.05.2023.
//

import UIKit
import SnapKit

protocol NewGameVCDelegate: AnyObject {
    func didSaveText(_ text: String)
}

class NewGameViewController: UIViewController {
    weak var delegate: NewGameVCDelegate?

    private let gameNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please a void game name 🚀"
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .secondarySystemBackground
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 19.0, weight: .bold)
        textField.textAlignment = .center
        return textField
    }()
    private lazy var setNewGame: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5.0
        button.setTitle("Add", for: .normal)
        button.backgroundColor = .systemIndigo
        button.tintColor = .white
        button.addTarget(self, action: #selector(addNewGame), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = "Games"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.app.fill"), style: .plain,
                                                            target: self, action: #selector(goToSettingPage))
        view.backgroundColor = .systemGreen
        view.addSubview(gameNameTextField)
        view.addSubview(setNewGame)
        configureConstraints()
        gameNameTextField.delegate = self
    }
    
    @objc func addNewGame() {
        if let text = gameNameTextField.text {
            delegate?.didSaveText(text)
            self.dismiss(animated: true, completion: nil)
        }
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

extension NewGameViewController: UITextFieldDelegate {

    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }

        print(text)
        
    }
 
}

