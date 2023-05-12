//
//  UserViewController.swift
//  ScoreSphere
//
//  Created by macbook pro on 11.05.2023.
//

import UIKit
import SnapKit

enum Color: String {
    case black
    case red
    case yellow
}


class UserViewController: UIViewController, UITextFieldDelegate {
    
    let nameTextField = UITextField()
    private let colorCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 40, height: 40)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: ColorCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New User"
        view.backgroundColor = .systemPurple
        setupUI()
        
        
        
    }
    
    private func setupUI() {
        view.addSubview(nameTextField)
        view.addSubview(colorCollectionView)
        designLabel()
        designCollectionView()
        configureConstraints()
    }
    
    private func designLabel() {
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.borderColor = UIColor.black.cgColor
        nameTextField.placeholder = "Please a void name..."
        nameTextField.delegate = self
        nameTextField.textAlignment = .center
    }
    
    private func designCollectionView() {
        colorCollectionView.dataSource = self
        colorCollectionView.delegate = self
    }
    
    private func configureConstraints() {
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        colorCollectionView.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
        }
        
    }
}

extension UserViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = colorCollectionView.dequeueReusableCell(withReuseIdentifier: ColorCollectionViewCell.identifier, for: indexPath) as? ColorCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = .systemYellow
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.systemRed.cgColor
        cell.layer.cornerRadius = 20.0
        return cell
        
    }
}
