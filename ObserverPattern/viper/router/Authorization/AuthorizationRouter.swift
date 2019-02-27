//
//  AuthorizationRouter.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class AuthorizationRouter: AuthorizationRouterInput {
    
    /// экземпляр ViewController
    weak var view: UIViewController!
    /// идентификатор
    let registration = "registration"
    /// Идентификатор
    let account = "account"
    /// название сториборда
    let main = "Main"
    /// alert
    let alert = "Alert"
    /// ok alert
    let ok = "Ok"
        
    func showAlert(_ message: String?) {
        
        let alert = UIAlertController(title: self.alert, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: self.ok, style: .default, handler: nil)
        alert.addAction(okButton)
        
        view.present(alert, animated: true, completion: nil)
    }

    func showRegistrationView() {
        
        let mainStoryboard = UIStoryboard(name: main, bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: registration) as! RegistrationViewController
        
        view.show(vc, sender: nil)
    }
    
    func showAccount(userModel: UserModel) {
        
        let mainStoryboard = UIStoryboard(name: main, bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: account) as! AccountViewController
        vc.userModel = userModel
        
        view.showDetailViewController(vc, sender: nil)
    }
}
