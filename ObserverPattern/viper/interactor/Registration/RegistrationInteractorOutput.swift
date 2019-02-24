//
//  RegistrationInteractorOutput.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol RegistrationInteractorOutput: AnyObject {
    
    /// Сохранить данные пользователя
    ///
    /// - Parameter userModel: модель пользователя
    func saveUserData(userModel: UserModel!)
    
    /// Показать алерт
    ///
    /// - Parameter text: текст алерта
    func showAlert(text: String)
}
