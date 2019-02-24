//
//  User.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
    
    @objc var login: String
    @objc var password: String
    @objc var name: String
    @objc var surname: String
    @objc var bDay: String
    @objc var mail: String
    
    init(login: String, password: String, name: String, surname: String, bDay: String, mail: String) {
        self.login = login
        self.password = password
        self.name = name
        self.surname = surname
        self.bDay = bDay
        self.mail = mail
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(login, forKey: #keyPath(User.login))
        aCoder.encode(password, forKey: #keyPath(User.password))
        aCoder.encode(name, forKey: #keyPath(User.name))
        aCoder.encode(surname, forKey: #keyPath(User.surname))
        aCoder.encode(bDay, forKey: #keyPath(User.bDay))
        aCoder.encode(mail, forKey: #keyPath(User.mail))
    }
    
    required init?(coder aDecoder: NSCoder) {
        login = aDecoder.decodeObject(forKey: #keyPath(User.login)) as! String
        password = aDecoder.decodeObject(forKey: #keyPath(User.password)) as! String
        name = aDecoder.decodeObject(forKey: #keyPath(User.name)) as! String
        surname = aDecoder.decodeObject(forKey: #keyPath(User.surname)) as! String
        bDay = aDecoder.decodeObject(forKey: #keyPath(User.bDay)) as! String
        mail = aDecoder.decodeObject(forKey: #keyPath(User.mail)) as! String
    }  
}
