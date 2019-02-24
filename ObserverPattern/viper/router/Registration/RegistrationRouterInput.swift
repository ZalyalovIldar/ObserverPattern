//
//  RegistrationRouterInput.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol RegistrationRouterInput: AnyObject {
    
    /// Показать алерт
    ///
    /// - Parameter message: текст алерта
    func showAlert(_ message: String?)
    
    /// Показать аккаунт пользователя
    ///
    /// - Parameter userModel: модель пользователя
    func showAccount(userModel: UserModel)
}
