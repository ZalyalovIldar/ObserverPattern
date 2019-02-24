//
//  AuthorizationViewOutput.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol AuthorizationViewOutput: AnyObject {
    
    /// Получить аккаунт пользователя
    ///
    /// - Parameters:
    ///   - login: по логину
    ///   - password: паролю
    func obtainUserAccount(login: String, password: String)
    
    /// Показать страницу регистрации
    func showRegistrationView()
}
