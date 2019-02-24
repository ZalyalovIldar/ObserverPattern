//
//  DataBaseOutput.swift
//  ObserverPattern
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol DataBaseOutput: AnyObject {
    
    /// Передает модель пользователя для того, чтобы показать его страничку
    ///
    /// - Parameter userModel: модель пользователя
    func showData(userModel: UserModel!)
    
    /// Выдает алерт при каких-то недочетах
    ///
    /// - Parameter text: текст алерта
    func showAlert(text: String)
}
