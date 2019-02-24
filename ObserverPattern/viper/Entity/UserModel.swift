//
//  UserModel.swift
//  ObserverPattern
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class UserModel: NSObject, NSCoding {
    
    /// логин пользователя
    @objc var login: String
    /// пароль пользователя
    @objc var password: String
    /// Имя пользователя
    @objc var name: String
    /// Фамилия пользователя
    @objc var surname: String
    /// Год рождения пользователя
    @objc var yearOfBirth: Int
    /// Мейл пользователя
    @objc var email: String
    
    init(login: String, password: String, name: String, surname: String, yearOfBirth: Int, email: String) {
        
        self.login = login
        self.name = name
        self.password = password
        self.surname = surname
        self.yearOfBirth = yearOfBirth
        self.email = email
    }
    
    /// Кодирование пользователя
    ///
    /// - Parameter aCoder: aCoder типа NSCoder
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(login, forKey: #keyPath(UserModel.login))
        aCoder.encode(password, forKey: #keyPath(UserModel.password))
        aCoder.encode(name, forKey: #keyPath(UserModel.name))
        aCoder.encode(surname, forKey: #keyPath(UserModel.surname))
        aCoder.encode(yearOfBirth, forKey: #keyPath(UserModel.yearOfBirth))
        aCoder.encode(email, forKey: #keyPath(UserModel.email))
    }
    
    /// Декодирование пользователя
    ///
    /// - Parameter aDecoder: aDecoder типа NSCoder
    required init?(coder aDecoder: NSCoder) {
        
        login = aDecoder.decodeObject(forKey: #keyPath(UserModel.login)) as? String ?? ""
        name = aDecoder.decodeObject(forKey: #keyPath(UserModel.name)) as? String ?? ""
        password = aDecoder.decodeObject(forKey: #keyPath(UserModel.password)) as? String ?? ""
        surname = aDecoder.decodeObject(forKey: #keyPath(UserModel.surname)) as? String ?? ""
        yearOfBirth = aDecoder.decodeInteger(forKey: #keyPath(UserModel.yearOfBirth))
        email = aDecoder.decodeObject(forKey: #keyPath(UserModel.email)) as? String ?? ""
    }
}
