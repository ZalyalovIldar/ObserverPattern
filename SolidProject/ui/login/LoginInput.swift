//
//  LoginInput.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

protocol LoginInput: AnyObject {
    
    // отображение сообщений
    func showMessage(text: String?)
    func printMessage(text: String?)
    
    // отборжание информации о пользователе
    func showProfile(user: User)
}
