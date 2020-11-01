//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Andrey Antipov on 22.10.2020.
//  Copyright © 2020 Andrey Antipov. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    // сколько максимум ячеек должно поместиться в секцию
    private let maxCountOfItemsInSection: Int = 3
    
    // сколько всего секций с ячейками
    private var countOfSections: Int = 0
    
    // сколько секций заполнены целиком ячеками
    private var countOfFullSections: Int = 0
    
    private var photos: [String] = [] {
        didSet {
            // сколько всего секций с ячейками
            self.countOfSections = lroundf(Float(photos.count / maxCountOfItemsInSection))
            // сколько секций заполнены целиком ячеками
            self.countOfFullSections = Int(photos.count / maxCountOfItemsInSection)
            // переформировать коллекцию
            collectionView.reloadData()
        }
    }
    
    // коллекция
    private lazy var collectionView: UICollectionView = {
        // задаем слой
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        // создаем коллекцию с нулевым фреймом и ранее определенным слоём
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // регистрируем ячейку
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PhotosCollectionViewCell.self))
        // всё выровнять
        collectionView.toAutoLayout()
        // белый фон
        collectionView.backgroundColor = .white
        //collectionView.showsVerticalScrollIndicator = false

        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.photos = Storage.photos
        
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Показать навигационную панель
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: Layout
extension PhotosViewController {
    
    // Ограничители отрисовки
    private func setupLayout() {
        view.addSubview(collectionView)
        
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    // Задаёт количество секций
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // в каждой секции 3 ячейки (делим на три и округляем в большую сторону)
        return countOfSections
    }
    
    // Задаёт количество ячеек в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        // если секция полностью заполнена
        case 0...(countOfFullSections-1):
            return maxCountOfItemsInSection
        // если секция частично заполнена
        case countOfFullSections...(countOfSections-1):
            return photos.count % maxCountOfItemsInSection
        // если незапланированная секция
        default:
            return 0
        }
    }
    
    // Формирует ячейку конкретной строки конкретной секции
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotosCollectionViewCell.self), for: indexPath) as! PhotosCollectionViewCell
        cell.photo = photos[indexPath.section * maxCountOfItemsInSection + indexPath.row]
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegate {
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    var offset: CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width - offset * (CGFloat(maxCountOfItemsInSection)+1)) / CGFloat(maxCountOfItemsInSection)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return offset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return offset
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: offset, left: offset, bottom: .zero, right: offset)
    }
}
