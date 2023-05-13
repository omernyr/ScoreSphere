//
//  SelectedViewController.swift
//  ScoreSphere
//
//  Created by macbook pro on 13.05.2023.
//

import UIKit
import SnapKit

class SelectedViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemCyan
        designLabel()
    }
    
    private func designLabel() {
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.black.cgColor
        configureConstraints()
    }
    
    private func configureConstraints() {
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(20)
        }
    }

}
