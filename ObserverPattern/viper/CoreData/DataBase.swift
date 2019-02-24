//
//  DataBase.swift
//  ObserverPattern
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class DataBase: DataBaseInput {
    
    /// модель пользователя
    var userModel: UserModel?
    /// Презентер, к которому отправляются данные
    var presenter: DataBaseOutput!
    /// Массив моделей пользователей
    var users: [UserModel] = []
    /// UserDefaults
    let defaults = UserDefaults.standard
    /// ключ
    let key = "users"
    /// текст для алерта
    let alert1 = "Такая страница уже создана."
    /// текст для алерта
    let alert2 = "Логин или пароль введены неправильно"
    
    func saveData(userModel: UserModel!) {
        
        if self.searchUser(login: userModel.login, password: userModel.password) == nil {
            
            users.append(userModel)
            
            let archiver = NSKeyedArchiver.archivedData(withRootObject: users)
            defaults.set(archiver, forKey: key)
            defaults.synchronize()
            
            presenter.showData(userModel: userModel)
        } else {
            
            presenter.showAlert(text: alert1)
        }
    }
    
    func obtainData(login: String, password: String) {
        
        if defaults.data(forKey: key) != nil {
            
            let data = defaults.data(forKey: key)
            let userData = NSKeyedUnarchiver.unarchiveObject(with: data!) as? [UserModel]
            
            if userData != nil {
                
                for user in userData! {
                    
                    if user.login == login && user.password == password {
                        
                        userModel = user
                        presenter.showData(userModel: userModel)
                    }
                }
            } else {
                presenter.showAlert(text: alert2)
            }
        }
    }
    
    /// Поиск пользователя в базе по логину и паролю
    ///
    /// - Parameters:
    ///   - login: логин
    ///   - password: пароль
    /// - Returns: тип Any? - может вернуться пользователь, либо нил при отсутствии пользователя
    func searchUser(login: String, password:String) -> Any? {
        
        if defaults.data(forKey: key) != nil {
            let data = defaults.data(forKey: key)
            let userData = NSKeyedUnarchiver.unarchiveObject(with: data!) as? [UserModel]
        
            if userData == nil {
                return nil
            } else {
                users = (userData)!
            }
            for user in users {
                
                if user.login == login && user.password == password {
                    
                    return user
                }
            }
        }
        return nil
    }
}
