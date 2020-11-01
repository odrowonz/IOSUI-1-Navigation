//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Andrey Antipov on 18.10.2020.
//  Copyright © 2020 Andrey Antipov. All rights reserved.
//

import UIKit

class ProfileTableHeaderView: UIView {
    
    var profile: Profile? {
        didSet {
            guard let profile = profile else { return }
            configure(profile)
        }
    }
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.layer.borderWidth = 3
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let profileNameLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private lazy var profileStatusLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    // ***
    private lazy var profileStatusTextField: UITextField = {
        let textField = UITextField()
        textField.insertLeftIndent()
        textField.toAutoLayout()
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.textAlignment = .left
        return textField
    }()
    // ***
    
    private lazy var showStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.toAutoLayout()
        button.setTitle("Set status", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.roundCornersWithRadius(4, top: true, bottom: true, shadowEnabled: true)
        button.setShadowPath()
        
        button.addTarget(self, action: #selector(showStatusButtonTapped), for: .touchUpInside)
        return button
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Нажатие на фон чтобы скрыть клавиатуру
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapBackground))
        addGestureRecognizer(tapGesture)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Configure cell with selected device
    /// - Parameter profile: Profile
    func configure(_ profile: Profile) {
        profileImageView.image = UIImage(named: profile.image)
        profileNameLabel.text = profile.name
        profileStatusLabel.text = profile.status
        profileStatusTextField.text = profile.status
    }
    
    // MARK: Actions
    @objc private func showStatusButtonTapped() {
        profile?.status = profileStatusTextField.text!
        endEditing(true)
    }

    @objc private func tapBackground() {
        // Спрятать клавиатуру
        endEditing(true)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.roundCornersWithRadius(profileImageView.bounds.height/2, top: true, bottom: true, shadowEnabled: false)
        
        showStatusButton.setShadowPath()
    }
    
    // MARK: Helpers
    func setupLayout() {
        addSubview(profileImageView)
        addSubview(profileNameLabel)
        addSubview(profileStatusLabel)
        addSubview(profileStatusTextField)
        addSubview(showStatusButton)
        
        layoutMarginsDidChange()
        
        let constraints = [
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            profileImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
        
            profileNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            profileNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            profileNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        
            profileStatusLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            profileStatusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        
            profileStatusTextField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            profileStatusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileStatusTextField.topAnchor.constraint(equalTo: profileStatusLabel.bottomAnchor, constant: 5),
            profileStatusTextField.heightAnchor.constraint(equalToConstant: 40),
            showStatusButton.topAnchor.constraint(equalTo: profileStatusTextField.bottomAnchor, constant: 16),
            

            showStatusButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            showStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
