//
//  UserViewController.swift
//  ScoreSphere
//
//  Created by macbook pro on 11.05.2023.
//

import UIKit
import SnapKit

enum Color: CaseIterable {
    
    case black
    case red
    case yellow
    case gray
    case second
    case indigo
    case purple
    case green
    case brown
    
    
    func colorValue() -> Int {
        let colorInt = Color.allCases.count
        return colorInt
    }
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
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(nameTextField)
        view.addSubview(colorCollectionView)
        title = "New User"
        view.backgroundColor = .systemPurple
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
        colorCollectionView.layer.cornerRadius = 5.0
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
        Color.colorValue(.black)()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = colorCollectionView.dequeueReusableCell(withReuseIdentifier: ColorCollectionViewCell.identifier, for: indexPath) as? ColorCollectionViewCell else { return UICollectionViewCell() }
        
        setCellColors(collectionView: colorCollectionView)
        cell.layer.cornerRadius = 20.0
        return cell
        
    }
    
    func setCellColors(collectionView: UICollectionView) {
        collectionView.visibleCells.forEach { cell in
            if let indexPath = collectionView.indexPath(for: cell) {
                switch indexPath.row % 9 {
                case 0:
                    cell.backgroundColor = .systemRed
                case 1:
                    cell.backgroundColor = .systemOrange
                case 2:
                    cell.backgroundColor = .systemYellow
                case 3:
                    cell.backgroundColor = .systemGreen
                case 4:
                    cell.backgroundColor = .systemBlue
                case 5:
                    cell.backgroundColor = .systemPurple
                case 6:
                    cell.backgroundColor = .systemBrown
                case 7:
                    cell.backgroundColor = .lightGray
                case 8:
                    cell.backgroundColor = .systemFill
                default:
                    cell.backgroundColor = .clear
                }
            }
        }
    }
}
