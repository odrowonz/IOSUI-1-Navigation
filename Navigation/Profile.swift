//
//  Profile.swift
//  Navigation
//
//  Created by Andrey Antipov on 18.10.2020.
//  Copyright © 2020 Andrey Antipov. All rights reserved.
//
struct Profile {
    // никнейм пользователя
    let name: String
    
    // статус
    var status: String?
    
    // имя аватара из каталога 'Assets.xcassets'
    let image: String
    
    // возраст
    let age: Int
    
    // количество лайков
    let karma: Int
}
