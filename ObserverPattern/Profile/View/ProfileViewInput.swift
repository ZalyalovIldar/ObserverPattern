//
//  ProfileViewInput.swift
//  ObserverPattern
//
//  Created by Петр on 23/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol ProfileViewInput: AnyObject {
 
    /// Set profile info
    ///
    /// - Parameter user: user
    func setProfileInfo(_ user: User?)
}
