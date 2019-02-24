//
//  AuthorizationIntnractorInput.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol AuthorizationIntnractorInput: AnyObject {
    
    /// Проверить корректность пользователя
    ///
    /// - Parameters:
    ///   - login: по логину
    ///   - password: и паролю
    func checkData(login: String, password: String)
}
