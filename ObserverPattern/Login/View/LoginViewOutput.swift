//
//  LoginViewOutput.swift
//  ObserverPattern
//
//  Created by Петр on 23/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol LoginViewOutput: AnyObject {
 
    /// Validate login and password
    ///
    /// - Parameters:
    ///   - login: user's login
    ///   - password: user's password
    func validateLoginAndPassword(login: String?, password: String?)
}
