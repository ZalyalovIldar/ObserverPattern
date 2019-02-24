//
//  RegistrationPresenter.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

class RegistrationPresenter: RegistrationOutput {
    
    weak var view: RegistrationInput!
    var dataManager: DataManagerProtocol!
    var strings: Strings!
    
    
    func didSavePressed(login: String, password: String, repeatPass: String, name: String, surname: String, bDay: String, mail: String) {
        
        //если хотя бы одно поле пустое - выдаем ошибку
        if (login == "" || password == "" || repeatPass == "" ||
            name == "" || surname == "" || bDay == "" || mail == "") {
            view.showMessage(text: strings.error_field_empty)
            return
        }
        
        //если пароли не совпадают - выдаем ошибку
        if (password != repeatPass){
            view.showMessage(text: strings.error_passwords_not_equal)
            return
        }
        
        //создаем юзера и массив юзеров для сохранения
        let user = User(login: login, password: password, name: name, surname: surname, bDay: bDay, mail: mail)
        var users: [User] = []
        
        //загружаем старых юзеров
        let loadedUsers = dataManager.getAllUsers()
        if loadedUsers != nil {
            users = loadedUsers!
        }
        
        //обновляем бд
        users.append(user)
        dataManager.saveUser(user: users)
        
        view.openProfileScreen(user: user)
    }
}
