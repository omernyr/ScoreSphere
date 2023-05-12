//
//  NewGameViewController.swift
//  ScoreSphere
//
//  Created by macbook pro on 8.05.2023.
//

import UIKit
import SnapKit

class NewGameViewController: UIViewController, UITextFieldDelegate {
    
    private let gameNameTextField = UITextField()
    
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
        designTextField()
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
    
    private func configureConstraints() {
        gameNameTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(30)
            make.height.equalTo(50.0)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func goToSettingPage() {
        let vc = UserViewController()
        present(vc, animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        print(updatedText)
        return true
    }
    
}
