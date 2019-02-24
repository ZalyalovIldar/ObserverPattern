//
//  DataBaseInput.swift
//  ObserverPattern
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol DataBaseInput: AnyObject {
    
    /// Метод, сохраняющий пользователя в UserDefaults при регистрации
    ///
    /// - Parameter userModel: модель пользователя
    func saveData(userModel: UserModel!)
    
    /// Получение данных о пользователе при авторизации по логину и паролю
    ///
    /// - Parameters:
    ///   - login: логин
    ///   - password: пароль
    func obtainData(login: String, password: String)
}
