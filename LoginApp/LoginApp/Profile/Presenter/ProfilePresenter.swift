//
//  ProfilePresenter.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 24/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

class ProfilePresenter: ProfileViewOutput {
    
    weak var view: ProfileViewInput!
    
    func sendUser(_ sender: Account) {
        view.setUserData(login: sender.login, name: sender.name, secondName: sender.secondName, phone: sender.phoneNumber, email: sender.email, yearOfBirth: sender.dateOfBirth)
    }
    
    
}
