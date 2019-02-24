//
//  LoginViewInput.swift
//  ObserverPattern
//
//  Created by Петр on 23/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol LoginViewInput: AnyObject {
 
    /// Clear login and password fields
    func clearFields()
    
    /// Showing alert
    ///
    /// - Parameter message: text
    func showAlert(message: String?)
    
    /// Show profile page
    func showProfile()
}
