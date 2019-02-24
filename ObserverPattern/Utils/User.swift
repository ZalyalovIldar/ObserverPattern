//
//  User.swift
//  ObserverPattern
//
//  Created by Петр on 24/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

struct User: Codable {
    
    /// User's name
    var name: String?
    
    /// User's surname
    var surname: String?
    
    /// Date of birth
    var birthday: String?
    
    /// User's nickname
    var nickname: String?
    
    /// Password
    var password: String?
    
    /// E'mail address
    var email: String?
    
    init(nickname: String?, password: String?, name: String?, surname: String?, birthday: String?, email: String?) {
        
        self.nickname = nickname
        self.password = password
        self.name = name
        self.surname = surname
        self.birthday = birthday
        self.email = email
    }
}
