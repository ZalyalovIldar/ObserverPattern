//
//  RegisterViewInput.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 24/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

/// describes register input methods
protocol RegisterViewInput: AnyObject {
    
    /// set register status
    ///
    /// - Parameter text: text which will be status
    func setStatus(_ text: String)
    
    ///  pop controller from navigation bar stack
    func popViewController()
}
