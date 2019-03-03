//
//  LoginOutput.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

protocol LoginOutput {
    
    /// нажатие на кнопку входа
    ///
    /// - Parameters:
    ///   - login: введенный логин
    ///   - password: введенный пароль
    func didEnterPressed(login: String, password: String)
}
