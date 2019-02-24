//
//  RegistrationInteractorInput.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol RegistrationInteractorInput: AnyObject {
    
    /// Проверить данные пользователя
    ///
    /// - Parameter userModel: Модель пользователя
    func checkUserData(userModel: UserModel?)
}
