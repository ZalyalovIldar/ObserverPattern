//
//  AuthorizationInteractor.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class AuthorizationInteractor: AuthorizationIntnractorInput {
    
    /// пустой String
    let emptyString = ""
    /// презентер, куда отправляем данные для обработки
    var presenter: AuthorizationInteractorOutput!
    /// текст для алерта
    let textOfAlert = "Введите все поля."
    
    func checkData(login: String, password: String) {
        
        if login != emptyString && password != emptyString {
            presenter.obtainUserModel(login: login, password: password)
        } else {
            presenter.showAlert(text: textOfAlert)
        }
    }
}
