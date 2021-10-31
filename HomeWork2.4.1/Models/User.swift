//
//  User.swift
//  HomeWork2.4.1
//
//  Created by Artur Anissimov on 30.10.2021.
//

import Foundation

struct User {
    var username: String
    var password: String
    var type: UserType
    var profile: [Profile]
}

enum UserType: String {
    case user = "Пользователь"
    case moderator = "Модератор"
    case admin = "Администратор"
}

struct Profile {
    var firstname: String
    var lastname: String
    var gender: UserGender
    var date: String
    var aboutUser: String
}

enum UserGender {
    case male
    case female
    
    var definition: String {
        switch self {
        case .male:
            return "Мужчина"
        case .female:
            return "Женщина"
        }
    }
}

extension User {
    static func getUsers() -> User {
        return User.init(
            username: "User",
            password: "Password",
            type: .user,
            profile: [Profile.init(
                firstname: "Artur", lastname: "Anissimov", gender: .male, date: "18.09.1993", aboutUser: "Hello! I'm iOS Developer!")])
    }
}
