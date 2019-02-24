//
//  RegistrationPresenter.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class RegistrationPresenter: RegistrationViewOutput, RegistrationInteractorOutput, DataBaseOutput {
    
    /// роутер, куда отправляем данные
    var view: RegistrationRouterInput!
    /// экземпляр класса, откуда получаем данные
    var dataBase: DataBaseInput!
    /// интерактор, куда отправляем данные для дальнейших операций
    var interactor: RegistrationInteractorInput!
    
    /// Проверить корректность данных и сохранить пользователя
    ///
    /// - Parameter userModel: модель пользователя
    func checkAndSaveUserData(userModel: UserModel!) {
        interactor.checkUserData(userModel: userModel)
    }
    
    /// Сохранить модель юзера в базе
    ///
    /// - Parameter userModel: модель юзера
    func saveUserData(userModel: UserModel!) {
        dataBase.saveData(userModel: userModel)
    }
    
    /// Показать алерт
    ///
    /// - Parameter text: текст алерта
    func showAlert(text: String) {
        view.showAlert(text)
    }
    
    /// Показать данные о пользователе
    ///
    /// - Parameter userModel: модель пользователя
    func showData(userModel: UserModel!) {
        view.showAccount(userModel: userModel)
    }
}
