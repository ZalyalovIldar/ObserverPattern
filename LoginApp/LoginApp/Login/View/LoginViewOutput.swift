//
//  LoginViewOutput.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 24/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

/// login describes login view output methods
protocol LoginViewOutput: AnyObject {
    
    /// login user
    ///
    /// - Parameters:
    ///   - login: entered login
    ///   - password: entered password
    func loginUser(login: String, password: String)
}
