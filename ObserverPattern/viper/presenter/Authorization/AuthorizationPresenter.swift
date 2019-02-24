//
//  AuthorizationPresenter.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class AuthorizationPresenter: AuthorizationViewOutput, AuthorizationInteractorOutput, DataBaseOutput {
    
    /// экземпляр класса, откуда получаем данные
    var dataBase: DataBaseInput!
    /// интерактор, куда отправляем данные для дальнейшей обработки
    var interactor: AuthorizationIntnractorInput!
    /// роутер, куда отправляем данные
    var router: AuthorizationRouterInput!
    
    /// Получение аккаунта пользователя
    ///
    /// - Parameters:
    ///   - login: по логину
    ///   - password: и паролю
    func obtainUserAccount(login: String, password: String) {
        interactor.checkData(login: login, password: password)
    }
    
    /// получить модель юзера
    ///
    /// - Parameters:
    ///   - login: по логину
    ///   - password: и паролю
    func obtainUserModel(login: String, password: String) {
        dataBase.obtainData(login: login, password: password)
    }
    
    /// Показать алерт
    ///
    /// - Parameter text: текст алерта
    func showAlert(text: String) {
        router.showAlert(text: text)
    }
    
    /// Показать вью регистации
    func showRegistrationView() {
        router.showRegistrationView()
    }
    
    /// Показать данные о пользователе
    ///
    /// - Parameter userModel: модель юзера
    func showData(userModel: UserModel!) {
        router.showAccount(userModel: userModel)
    }
}
