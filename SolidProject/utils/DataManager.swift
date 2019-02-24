//
//  DataManagerProtocol.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

protocol DataManagerProtocol {
    
    func saveUser(user: [User])
    
    func getUserByName(login: String) -> User?
    
    func getAllUsers() -> [User]?
    
}

class DataManager: DataManagerProtocol {
    
    let keyUsers = "key_user"
    
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
    
    func saveUser(user: [User]) {
        let archiever = NSKeyedArchiver.archivedData(withRootObject: user)
        UserDefaults.standard.set(archiever, forKey: keyUsers)
        UserDefaults.standard.synchronize()
    }
    
    func getUserByName(login: String) -> User? {
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
