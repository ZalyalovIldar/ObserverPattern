//
//  DataManagerProtocol.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

/// протокол к бд для инкапсуляции
protocol DataManagerProtocol {
    
    func saveUser(user: [User])
    
    func getUserByLogin(login: String) -> User?
    
    func getAllUsers() -> [User]?
    
}

/// база данных
class DataManager: DataManagerProtocol {
    
    let keyUsers = "key_user"
    
    /// получение всех пользователей
    ///
    /// - Returns: массив пользователей
    func getAllUsers() -> [User]? {
        var currentUsers: [User]?
        if let currentUsersData = UserDefaults.standard.data(forKey: keyUsers) {
            currentUsers = NSKeyedUnarchiver.unarchiveObject(with: currentUsersData) as? [User]
            if currentUsers != nil {
                for model in currentUsers! {
                    print("names = \(model.name)")
                }
            }
        }
        return currentUsers
    }
    
    /// сохранение массива пользователей в бд
    ///
    /// - Parameter user: масссив пользователей
    func saveUser(user: [User]) {
        let archiever = NSKeyedArchiver.archivedData(withRootObject: user)
        UserDefaults.standard.set(archiever, forKey: keyUsers)
        UserDefaults.standard.synchronize()
    }
    
    /// получение юзера по логину
    ///
    /// - Parameter login: логин пользователя
    /// - Returns: пользователь
    func getUserByLogin(login: String) -> User? {
        let allUsers = getAllUsers()
        if allUsers != nil {
            for user in allUsers! {
                if user.login == login{
                    return user
                }
            }
        }
        return nil
    }
}
