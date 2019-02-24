//
//  ProfileViewInput.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 24/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation


/// describes profiles unput methods
protocol ProfileViewInput: AnyObject {
    
    /// set users data for display
    ///
    /// - Parameters:
    ///   - login: login
    ///   - name: name
    ///   - secondName: sername
    ///   - phone: phone
    ///   - email: email
    ///   - yearOfBirth: year of birth
    func setUserData(login: String,
                     name: String,
                     secondName: String,
                     phone: String,
                     email: String,
                     yearOfBirth: String)
  }
