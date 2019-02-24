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
    
    func didEnterPressed(login: String, password: String) {
        if (login == "" || password == "") {
            view.showMessage(text: strings.error_field_empty)
            return
        }
        let user = dataManager.getUserByLogin(login: login)
        if user == nil {
            view.showMessage(text: strings.error_no_users)
            return
        } else {
            if user?.password != password {
                view.showMessage(text: strings.error_wrong_pass)
                return
            }
        }
        view.showProfile(user: user!)
    }
}
