//
//  PlugView.swift
//  NewsClient
//
//  Created by Aleksandr Avdukich on 26.10.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import UIKit

class PlugView: UIView {
    
    let stackView = UIStackView()
    
    // MARK: - IBActions & IBOutlets
    let label = UILabel()
    let buttonErrRepeat: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Повторить", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.5646422505, green: 0.5647425056, blue: 0.5646359324, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 160).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.borderColor = #colorLiteral(red: 0.5646422505, green: 0.5647425056, blue: 0.5646359324, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        return button
    }()
    
    let buttonErrSettings: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Настройки", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.5646422505, green: 0.5647425056, blue: 0.5646359324, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 160).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.borderColor = #colorLiteral(red: 0.5646422505, green: 0.5647425056, blue: 0.5646359324, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        setupPlugView()
        settingsStackView()
        settingsSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPlugView() {
        addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(buttonErrRepeat)
        stackView.addArrangedSubview(buttonErrSettings)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let centerY = stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let centerX = stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let trailing = stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)
        let left = stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        
        NSLayoutConstraint.activate([centerY, centerX, trailing, left])
    }
    
    func setErrorTitle(_ title: String) {
        label.text = title
    }
    
    private func settingsSubviews() {
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.4979824424, green: 0.498071909, blue: 0.4979767799, alpha: 1)
    }
    
    private func settingsStackView() {
        stackView.axis         = .vertical
        stackView.alignment    = .center
        stackView.distribution = .fill
        stackView.spacing = 10
    }
    
}
