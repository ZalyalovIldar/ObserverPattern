//
//  RegistrationViewInput.swift
//  ObserverPattern
//
//  Created by Петр on 23/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol RegistrationViewInput: AnyObject {
    
    /// Showing alert
    ///
    /// - Parameter message: text
    func showAlert(message: String?)
    
    /// Showing profile page
    ///
    /// - Parameter user: user
    func showProfile()
}
