//
//  AuthorizationInteractorOutput.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol AuthorizationInteractorOutput: AnyObject {
    
    /// Получение модели пользователя
    ///
    /// - Parameters:
    ///   - login: по логину
    ///   - password: и паролю
    func obtainUserModel(login: String, password: String)
    
    /// Показать алерт
    ///
    /// - Parameter text: текст алерта
    func showAlert(text: String)
}
