//
//  RegistrationViewOutput.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol RegistrationViewOutput: AnyObject {
    
    /// Проверить и сохранить юзера
    ///
    /// - Parameter userModel: модель юзера
    func checkAndSaveUserData(userModel: UserModel!)
    
    /// Показать алерт
    ///
    /// - Parameter text: текст алерта
    func showAlert(text: String)
}
