//
//  RegisterPresenter.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 24/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

class RegisterPresenter: RegisterViewOutput {
    
    
    weak var view: RegisterViewInput!
    
    func registerNewAccount(login: String,
                            password: String,
                            repeatedPassword: String,
                            name: String,
                            secName: String,
                            email: String,
                            yearOfBirth: String,
                            phoneNumber: String) {
        
        if UserDefaults.standard.data(forKey: login) != nil {
            
            view.setStatus("User already created")
        
        } else if password == repeatedPassword &&
            login != "" &&
            password != "" {
            
            let newAccount = Account(login: login,
                                     password: password,
                                     name: name,
                                     secondName: secName,
                                     phoneNumber: phoneNumber,
                                     email: email,
                                     dateOfBirth: yearOfBirth)
            
            do
            {
                if #available(iOS 11.0, *) {
                    let archiver = try NSKeyedArchiver.archivedData(withRootObject: newAccount, requiringSecureCoding: false)
                
                UserDefaults.standard.set(archiver, forKey: newAccount.login)
                UserDefaults.standard.synchronize()
               
            } else {
                let archiver = NSKeyedArchiver.archivedData(withRootObject: newAccount)
                    UserDefaults.standard.set(archiver, forKey: newAccount.login)
                    UserDefaults.standard.synchronize()
            }
            } catch let error {
                print(error)
            }
           view.popViewController()
        } else { view.setStatus("Incorrect login or password")}
    }
    
}
