//
//  RegisterViewOutput.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 24/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

/// describe register  output methods
protocol RegisterViewOutput: AnyObject {
    
    /// set new user with data
    ///
    /// - Parameters:
    ///   - login: login
    ///   - password: password
    ///   - repeatedPassword: repeated password
    ///   - name: name
    ///   - secName: sec name
    ///   - email: email
    ///   - yearOfBirth: year of birth
    ///   - phoneNumber: phone number
    func registerNewAccount(login: String,
                            password: String,
                            repeatedPassword: String,
                            name: String,
                            secName: String,
                            email: String,
                            yearOfBirth: String,
                            phoneNumber: String)
    
}
