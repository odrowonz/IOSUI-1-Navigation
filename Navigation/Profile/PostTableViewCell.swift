//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Andrey Antipov on 18.10.2020.
//  Copyright © 2020 Andrey Antipov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var post: Post? {
        didSet {
            guard let post = post else { return }
            configure(post: post)
        }
    }
    
    /// Автор`(режиссер)
    private let postAuthorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = SystemColors.textFieldTextColor
        label.numberOfLines = 0
        label.textAlignment = .left
        label.toAutoLayout()
        return label
    }()
    
    /// Картинка (баннер)
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = SystemColors.imageViewBackgroundColor
        imageView.toAutoLayout()
        return imageView
    }()

    /// Описание
    private let postDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = SystemColors.grayColor
        label.numberOfLines = 0
        label.textAlignment = .left
        label.toAutoLayout()
        return label
    }()
    
    /// Лайки
    private let postLikesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = SystemColors.textFieldTextColor
        label.numberOfLines = 1
        label.textAlignment = .left
        label.toAutoLayout()
        return label
    }()
    
    /// Просмотры
    private let postViewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = SystemColors.textFieldTextColor
        label.numberOfLines = 1
        label.textAlignment = .right
        label.toAutoLayout()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    /// Configure cell with selected device
    /// - Parameter device: Device
    func configure(post: Post) {
        postAuthorLabel.text = post.author
        postDescriptionLabel.text = post.description
        postImageView.image = UIImage(named: post.image)
        postLikesLabel.text = "Likes: " + String(post.likes)
        postViewLabel.text = "Views: " + String(post.views)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
    // MARK: Layout
    func setupLayout() {
        contentView.addSubview(postAuthorLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(postDescriptionLabel)
        contentView.addSubview(postLikesLabel)
        contentView.addSubview(postViewLabel)
        
        let constraints = [
            postAuthorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postAuthorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postAuthorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            //postAuthorLabel.heightAnchor.constraint(equalToConstant: 40),
            //postAuthorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)//,
            
            postImageView.topAnchor.constraint(equalTo: postAuthorLabel.bottomAnchor, constant: 16),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            //postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            postDescriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            postDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            //postDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)//,
            
            postLikesLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: 16),
            postLikesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            postViewLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: 16),
            postViewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            contentView.bottomAnchor.constraint(equalTo: postViewLabel.bottomAnchor, constant: 16),
            contentView.bottomAnchor.constraint(equalTo: postLikesLabel.bottomAnchor, constant: 16)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
