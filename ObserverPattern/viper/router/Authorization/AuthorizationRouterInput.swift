//
//  AuthorizationRouterInput.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol AuthorizationRouterInput: AnyObject {
    
    /// Показать алерт
    ///
    /// - Parameter text: текст алерта
    func showAlert(text: String)
    
    /// Показать аккаунт пользователя
    ///
    /// - Parameter userModel: модель пользователя
    func showAccount(userModel: UserModel)
    
    /// Показать viewController регистрации
    func showRegistrationView()
}
