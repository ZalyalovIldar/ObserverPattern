//
//  Account.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 22/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation


/// account class that describing user info
class Account: NSObject, NSCoding {
    
    @objc var login: String
    @objc var password: String
    @objc var name: String
    @objc var secondName: String
    @objc var phoneNumber: String
    @objc var email: String
    @objc var dateOfBirth: String
    
    init(login: String,
         password: String,
         name: String,
         secondName: String,
         phoneNumber: String,
         email: String,
         dateOfBirth: String ) {
        
        self.login = login
        self.password = password
        self.name = name
        self.secondName = secondName
        self.phoneNumber = phoneNumber
        self.email = email
        self.dateOfBirth = dateOfBirth
    }
    
    
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(login, forKey: #keyPath(Account.login))
        aCoder.encode(password, forKey: #keyPath(Account.password))
        aCoder.encode(name, forKey: #keyPath(Account.name))
        aCoder.encode(secondName, forKey: #keyPath(Account.secondName))
        aCoder.encode(phoneNumber, forKey: #keyPath(Account.phoneNumber))
        aCoder.encode(email, forKey: #keyPath(Account.email))
        aCoder.encode(dateOfBirth, forKey: #keyPath(Account.dateOfBirth))
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        login       = aDecoder.decodeObject(forKey: #keyPath(Account.login)) as! String
        password    = aDecoder.decodeObject(forKey: #keyPath(Account.password)) as! String
        name        = aDecoder.decodeObject(forKey: #keyPath(Account.name)) as! String
        secondName  = aDecoder.decodeObject(forKey: #keyPath(Account.secondName)) as! String
        phoneNumber = aDecoder.decodeObject(forKey: #keyPath(Account.phoneNumber)) as! String
        email       = aDecoder.decodeObject(forKey: #keyPath(Account.email)) as! String
        dateOfBirth = aDecoder.decodeObject(forKey: #keyPath(Account.dateOfBirth)) as! String
        
        
        
    }
    
}
