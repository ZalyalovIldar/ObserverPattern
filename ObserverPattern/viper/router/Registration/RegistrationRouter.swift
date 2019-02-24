//
//  RegistrationRouter.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class RegistrationRouter: RegistrationRouterInput {
    
    /// экземпляр ViewController
    weak var view: UIViewController!
    /// идентификатор
    let accountIdentifier = "account"
    /// Имя сториборда
    let main = "Main"
    
    func showAlert(_ message: String?) {
        
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        
        view.present(alert, animated: true, completion: nil)
    }
    
    func showAccount(userModel: UserModel) {
        
        let mainStoryboard = UIStoryboard(name: main, bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: accountIdentifier) as! AccountViewController
        vc.userModel = userModel
        
        view.showDetailViewController(vc, sender: nil)
    }
}
