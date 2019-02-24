//
//  LoginPresenter.swift
//  ObserverPattern
//
//  Created by Петр on 23/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class LoginPresenter: LoginViewOutput {    
    
    /// Login view controller
    weak var loginView: LoginViewInput!
    
    /// Data manager
    var dataManager: DataManagerProtocol!
    
    // MARK: - Login View Output
    
    func validateLoginAndPassword(login: String?, password: String?) {
        
        guard (login?.count)! > 0 && (password?.count)! > 0  else {
            
            loginView.clearFields()
            return
        }
        
        if let user = dataManager.obtainUser() {
         
            if user.nickname == login && user.password == password {

                loginView.showProfile()
                return
            }
            
            loginView.showAlert(message: wrongFields)
            loginView.clearFields()
        }
        else {
            
            loginView.clearFields()
            loginView.showAlert(message: firstlyRegistrate)
        }
        
        
    }
}
