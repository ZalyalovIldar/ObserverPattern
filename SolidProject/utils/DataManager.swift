//
//  DataManagerProtocol.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

protocol DataManagerProtocol {
    func saveUser(user: User)
}

class DataManager: DataManagerProtocol {
    let keyUser = "key_user"
    
    func saveUser(user: User) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(user), forKey: keyUser)
        UserDefaults.standard.synchronize()
        print("saved user = \(user)")
    }
}
