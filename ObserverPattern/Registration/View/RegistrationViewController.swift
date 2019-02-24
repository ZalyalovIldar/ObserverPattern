//
//  RegistrationViewController.swift
//  ObserverPattern
//
//  Created by Петр on 23/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, RegistrationViewInput {
    
    /// ScrollView
    @IBOutlet weak var scrollView: UIScrollView!
    
    /// Login text field
    @IBOutlet weak var loginTextField: UITextField!
    
    /// Password text field
    @IBOutlet weak var passwordTextField: UITextField!
    
    /// Confirm password text field
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    /// Name text field
    @IBOutlet weak var nameTextField: UITextField!
    
    /// Surname text field
    @IBOutlet weak var surnameTextField: UITextField!
    
    /// Birthday text field
    @IBOutlet weak var birthdayTextField: UITextField!
    
    /// Email text field
    @IBOutlet weak var emailTextField: UITextField!
    
    /// Registration presenter
    var registrationPresenter: RegistrationViewOutput!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: OperationQueue.main) { (notification) in
            self.showKeyboard(notification: notification)
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: OperationQueue.main) { (notification) in
            self.hideKeyboard()
        }

        NotificationCenter.default.addObserver(forName: .changeColorThemeNotification, object: nil, queue: OperationQueue.main) { (notification) in
            self.setColorTheme(notification)
        }
        
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
    }

    
    @objc private func showKeyboard(notification: Notification) {
        
        guard let keyboardFrameValue = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }
        
        let keyboardFrame = view.convert(keyboardFrameValue.cgRectValue, from: nil)
        scrollView.contentInset.bottom = keyboardFrame.size.height
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
    @objc private func hideKeyboard() {
        
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }

    
    /// Handle registration button click
    ///
    /// - Parameter sender: registrate button
    @IBAction func didRegistrationButtonPressed(_ sender: Any) {
        
        registrationPresenter.registrateUser(
            login: loginTextField.text,
            password: passwordTextField.text,
            repeatedPassword: confirmPasswordTextField.text,
            name: nameTextField.text,
            surname: surnameTextField.text,
            birthday: birthdayTextField.text,
            email: emailTextField.text
        )
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
    
    
    // MARK: - Registration View Input
    
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
