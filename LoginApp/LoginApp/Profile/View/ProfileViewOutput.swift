//
//  ProfileViewOutput.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 24/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

/// describes profile output methods
protocol ProfileViewOutput: AnyObject {
    
    /// send user's data
    ///
    /// - Parameter sender: User's account
    func sendUser(_ sender: Account)
    
}
