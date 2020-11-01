//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Andrey Antipov on 22.10.2020.
//  Copyright © 2020 Andrey Antipov. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    var photo: String? {
        didSet {
            guard let myphoto = photo else { return }
            photoImageView.image = UIImage(named: myphoto)
        }
    }
    
    /// Картинка (фото)
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.toAutoLayout()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLayout()
    }
}

// MARK: Layout
extension PhotosCollectionViewCell {
    func setupLayout() {
        addSubview(photoImageView)

        let constraints = [
            photoImageView.topAnchor.constraint(equalTo: topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
