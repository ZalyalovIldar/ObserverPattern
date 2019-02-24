//
//  RegistrationInteractor.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class RegistrationInteractor: RegistrationInteractorInput {
    
    /// пустой String
    let emptyString = ""
    /// презентер, в который отправляются данные для дальнейшей обработки
    var presenter: RegistrationInteractorOutput!
    /// Текст для алерта
    let textOfAlert = "Введите все поля."
    
    func checkUserData(userModel: UserModel?) {
        
        if userModel?.email != emptyString && userModel?.login != emptyString && userModel?.name != emptyString && userModel?.password != emptyString && userModel?.surname != emptyString && userModel?.yearOfBirth != nil {
            
            presenter.saveUserData(userModel: userModel)
        } else {
            presenter.showAlert(text: textOfAlert)
        }
    }
}
