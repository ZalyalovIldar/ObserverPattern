//
//  LoginViewController.swift
//  ObserverPattern
//
//  Created by Петр on 23/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginViewInput {

    /// Login text field
    @IBOutlet weak var loginTextField: UITextField!
    
    /// Login label
    @IBOutlet weak var loginLabel: UILabel!
    
    /// Password text field
    @IBOutlet weak var passwordTextField: UITextField!
    
    /// Password label
    @IBOutlet weak var passwordLabel: UILabel!
    
    /// Login button
    @IBOutlet weak var loginButton: UIButton!
    
    /// Registrate button
    @IBOutlet weak var registrateButton: UIButton!
    
    /// Login presenter
    var loginPresenter: LoginPresenter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: .changeColorThemeNotification, object: nil, queue: OperationQueue.main) { (notification) in
            self.setColorTheme(notification)
        }

    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    
    /// Handle login button click
    ///
    /// - Parameter sender: login button
    @IBAction func didLoginButtonPressed(_ sender: Any) {
        
        loginPresenter.validateLoginAndPassword(login: loginTextField.text, password: passwordTextField.text)
    }
    
    
    
    /// Theme setter
    ///
    /// - Parameter notification: notification
    @objc func setColorTheme(_ notification: Notification) {
        
        guard let userInfo = notification.userInfo as? [String : Bool] else { return }
        
        if userInfo[darkMode] ?? false {
            
            view.backgroundColor = UIColor.black
            
            loginButton.backgroundColor = UIColor.red
            registrateButton.backgroundColor = UIColor.red
            
            loginLabel.textColor = UIColor.white
            passwordLabel.textColor = UIColor.white
            
        } else {
            
            view.backgroundColor = UIColor.white
            
            loginButton.backgroundColor = UIColor.blue
            registrateButton.backgroundColor = UIColor.blue
            
            loginLabel.textColor = UIColor.black
            passwordLabel.textColor = UIColor.black
        }
    }
    
    
    // MARK: - Login View Input
    
    func clearFields() {
    
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    
    func showAlert(message: String?) {
        
        let alert = UIAlertController(title: "Hey, bro!", message: message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func showProfile() {
        
        let mainStoryboard = UIStoryboard(name: Identifiers.main.rawValue, bundle: nil)
        let profileVC = mainStoryboard.instantiateViewController(withIdentifier: Identifiers.profile.rawValue) as! ProfileViewController
        
        self.show(profileVC, sender: nil)
    }
    
    
}
