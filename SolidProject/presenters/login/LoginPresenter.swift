//
//  LoginPresenter.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

class LoginPresenter: LoginOutput {
    
    weak var view: LoginInput!
    var dataManager: DataManagerProtocol!
    var strings: Strings!
    
    /// метод нажатия на кнопку входа
    ///
    /// - Parameters:
    ///   - login: введенный логин
    ///   - password: введенный пароль
    func didEnterPressed(login: String, password: String) {
        
        // если логин или пароль пустые - вывод сообщения
        if (login == "" || password == "") {
            view.showMessage(text: strings.error_field_empty)
            return
        }
        let user = dataManager.getUserByLogin(login: login)
        // если пользователь по логину не найден - вывод сообщения
        if user == nil {
            view.showMessage(text: strings.error_no_users)
            return
        } else {
            // если введенный пароль неверный - вывод сообщения
            if user?.password != password {
                view.showMessage(text: strings.error_wrong_pass)
                return
            }
        }
        // открыие профиля пользователя
        view.showProfile(user: user!)
    }
}
