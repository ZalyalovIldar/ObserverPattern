//
//  LoginViewInput.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 24/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

/// protocol describes login view input methods
protocol LoginViewInput: AnyObject {
    
    /// perform segue
    ///
    /// - Parameters:
    ///   - withIdentifier: identifer
    ///   - sender: object which need perform
    func shoulPerfromSegue(withIdentifier: String, sender: Any?)
    
    /// set login status label
    ///
    /// - Parameter text: text of status(status)
    func setStatusLabel(_ text: String)
    
    /// clear text fields 
    func clearAllTextFields()
}
