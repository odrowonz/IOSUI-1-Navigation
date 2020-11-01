//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Andrey Antipov on 18.10.2020.
//  Copyright © 2020 Andrey Antipov. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private var posts: [Post] = [] {
        didSet {
            postTableView.reloadData()
        }
    }
    private var profiles: [Profile] = [] {
        didSet {
            postTableView.reloadData()
        }
    }
    
    private lazy var postTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        view.backgroundColor = .white
        
        // Спрятать навигационную панель
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        // Выровнять содержимое
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Спрятать навигационную панель
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        self.posts = Storage.posts
        self.profiles = Storage.profiles
        
        // Скройте NavigationBar, используя navigationBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.posts = Storage.posts
        self.profiles = Storage.profiles
        
        // Скройте NavigationBar, используя navigationBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
    }
}

extension ProfileViewController: UITableViewDataSource {
    // Обработать нажатие на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            performSegue(withIdentifier: "toPhotoGallery", sender: self)
        }
    }
    
    // Задаёт количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Задаёт количество строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            guard !self.posts.isEmpty else { return 0 }
            return self.posts.count
        default:
            return 0
        }
    }
    
    // Формирует ячейку конкретной строки конкретной секции
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as! PhotosTableViewCell
            cell.photo1 = "photo_04"
            cell.photo2 = "photo_07"
            cell.photo3 = "photo_08"
            cell.photo4 = "photo_11"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
            cell.post = self.posts[indexPath.row]
            return cell
        default:
            return UITableViewCell()
        }
    }

    // Представления для любого заголовка секции быть не должно,
    // кроме нулевой секции - для нее создается кастомизированное представление
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        guard section == 0 else { return nil }
        
        let headerView = ProfileTableHeaderView()
        headerView.configure(self.profiles[4], tableView: tableView)
        return headerView
    }
}

// Ограничители отрисовки
extension ProfileViewController {
    private func setupLayout() {
        view.addSubview(postTableView)
        
        let constraints = [
            postTableView.topAnchor.constraint(equalTo: view.topAnchor),
            postTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension ProfileViewController: UITableViewDelegate {
    // Высота всех заголовков секций ноль,
    // кроме нулевой секции - у нее автоподбор высоты
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section == 0 else { return .zero }
        return UITableView.automaticDimension
    }
    
    // Представления для любого поддона секции быть не должно
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    // Высота любого поддона секции ноль
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .zero
    }
    
    // Высота любого поддона секции ноль
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
