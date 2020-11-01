//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Andrey Antipov on 18.10.2020.
//  Copyright © 2020 Andrey Antipov. All rights reserved.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    
    var photo1: String? {
        didSet {
            guard let photo = photo1 else { return }
            photoImageView1.image = UIImage(named: photo)
        }
    }
    var photo2: String? {
        didSet {
            guard let photo = photo2 else { return }
            photoImageView2.image = UIImage(named: photo)
        }
    }
    var photo3: String? {
        didSet {
            guard let photo = photo3 else { return }
            photoImageView3.image = UIImage(named: photo)
        }
    }
    var photo4: String? {
        didSet {
            guard let photo = photo4 else { return }
            photoImageView4.image = UIImage(named: photo)
        }
    }

    /// Название Photos
    private let photosLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = SystemColors.textFieldTextColor
        label.text = "Photos"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.toAutoLayout()
        return label
    }()
    
    /// Кнопка перехода в фотогалерею
    private lazy var showPhotoGalleryButton: UIButton = {
        let button = UIButton(type: .system)
        button.toAutoLayout()
        // Set the button normal state background image.
        button.setBackgroundImage(UIImage(systemName: "arrow.right"), for: UIControl.State.normal)
        // Set the button highlighted state background image.
        button.setBackgroundImage(UIImage(systemName: "arrow.right"), for: UIControl.State.highlighted)
        //button.addTarget(self, action: #selector(showPhotoGalleryButtonTapped), for: .touchUpInside)
        return button
    }()
    
    /// Картинка (фото 1)
    private let photoImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = SystemColors.imageViewBackgroundColor
        imageView.toAutoLayout()
        return imageView
    }()
    
    /// Картинка (фото 2)
    private let photoImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = SystemColors.imageViewBackgroundColor
        imageView.toAutoLayout()
        return imageView
    }()
    
    /// Картинка (фото 3)
    private let photoImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = SystemColors.imageViewBackgroundColor
        imageView.toAutoLayout()
        return imageView
    }()
    
    /// Картинка (фото 4)
    private let photoImageView4: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = SystemColors.imageViewBackgroundColor
        imageView.toAutoLayout()
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    // MARK: Actions
    /*@objc private func showPhotoGalleryTapped() {
        // Перейти к фотогалерее
        UINavgigationController
        performSegue(withIdentifier: "ToPhotoGallery", sender: self)
    }*/
    
    // MARK: Layout
    func setupLayout() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(showPhotoGalleryButton)
        contentView.addSubview(photoImageView1)
        contentView.addSubview(photoImageView2)
        contentView.addSubview(photoImageView3)
        contentView.addSubview(photoImageView4)
        
        let constraints = [
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            photosLabel.bottomAnchor.constraint(equalTo: photoImageView1.topAnchor, constant: -12),
            photosLabel.bottomAnchor.constraint(equalTo: photoImageView2.topAnchor, constant: -12),
            photosLabel.bottomAnchor.constraint(equalTo: photoImageView3.topAnchor, constant: -12),
            photosLabel.bottomAnchor.constraint(equalTo: photoImageView4.topAnchor, constant: -12),
            
            showPhotoGalleryButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            showPhotoGalleryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            photoImageView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoImageView1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoImageView1.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
            photoImageView1.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
            photoImageView1.trailingAnchor.constraint(equalTo: photoImageView2.leadingAnchor, constant: -8),
            
            photoImageView2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoImageView2.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
            photoImageView2.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
            photoImageView2.trailingAnchor.constraint(equalTo: photoImageView3.leadingAnchor, constant: -8),
            
            photoImageView3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoImageView3.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
            photoImageView3.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
            photoImageView3.trailingAnchor.constraint(equalTo: photoImageView4.leadingAnchor, constant: -8),
            
            photoImageView4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoImageView4.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
            photoImageView4.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
