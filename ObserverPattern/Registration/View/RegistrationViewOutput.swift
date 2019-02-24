//
//  RegistrationViewOutput.swift
//  ObserverPattern
//
//  Created by Петр on 23/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol RegistrationViewOutput: AnyObject {
 
    /// Registrate new user
    func registrateUser(login: String?, password: String?, repeatedPassword: String?, name: String?, surname: String?, birthday: String?, email: String?)
}
