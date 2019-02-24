//
//  RegistrationPresenter.swift
//  ObserverPattern
//
//  Created by Петр on 23/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class RegistrationPresenter: RegistrationViewOutput {
    
    /// Login view controller
    weak var registrationView: RegistrationViewInput!
    
    /// Data manager
    var dataManager: DataManagerProtocol!
    
    
    // MARK: - Registration View Output
    
    func registrateUser(login: String?, password: String?, repeatedPassword: String?, name: String?, surname: String?, birthday: String?, email: String?) {
        
        guard password == repeatedPassword else { return }
        
        if login?.count ?? 0 > 0 && password?.count ?? 0 > 0 && name?.count ?? 0 > 0 && surname?.count ?? 0 > 0 && birthday?.count ?? 0 > 0 && email?.count ?? 0  > 0 {
            
            let currentUser = User(nickname: login, password: password, name: name, surname: surname, birthday: birthday, email: email)
            
            dataManager.registrateUser(currentUser)
            
            registrationView.showProfile()
            
            return
        }
        
        registrationView.showAlert(message: wrongFields)
        
    }
}
