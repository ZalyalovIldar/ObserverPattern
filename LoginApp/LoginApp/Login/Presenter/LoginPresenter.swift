//
//  LoginPresenter.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 24/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

class LoginPresenter: LoginViewOutput {
    
    weak var view: LoginViewInput!
   
    func loginUser(login: String, password: String) {
      
        if let currentAccountData = UserDefaults.standard.data(forKey: login) {
            
            do {
                guard let currentAccount  = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(currentAccountData)  as? Account else {return}
                
                if currentAccount.password == password {
                    view.shoulPerfromSegue(withIdentifier: "curAcc", sender: currentAccount)
                    view.clearAllTextFields()
                } else {view.setStatusLabel("Wrong password") }
            }
            catch let error {
                print(error)
            }
        } else {view.setStatusLabel("User not found")}
    }
}
