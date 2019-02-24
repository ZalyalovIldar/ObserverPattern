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
   
    /// Login label
    @IBOutlet weak var loginLabel: UILabel!
    
    /// Password text field
    @IBOutlet weak var passwordTextField: UITextField!
    
    /// Password label
    @IBOutlet weak var passwordLabel: UILabel!
    
    /// Confirm password text field
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    /// Confirm password label
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    
    /// Name text field
    @IBOutlet weak var nameTextField: UITextField!
    
    /// Name label
    @IBOutlet weak var nameLabel: UILabel!
    
    /// Surname text field
    @IBOutlet weak var surnameTextField: UITextField!
    
    /// Surname label
    @IBOutlet weak var surnameLabel: UILabel!
    
    /// Birthday text field
    @IBOutlet weak var birthdayTextField: UITextField!
    
    /// Birthday label
    @IBOutlet weak var birthdayLabel: UILabel!
    
    /// Email text field
    @IBOutlet weak var emailTextField: UITextField!
    
    /// Email label
    @IBOutlet weak var emailLabel: UILabel!
    
    /// Registrate button
    @IBOutlet weak var registrateButton: UIButton!
    
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
            
            registrateButton.backgroundColor = UIColor.red
            
            loginLabel.textColor = UIColor.white
            passwordLabel.textColor = UIColor.white
            confirmPasswordLabel.textColor = UIColor.white
            nameLabel.textColor = UIColor.white
            surnameLabel.textColor = UIColor.white
            birthdayLabel.textColor = UIColor.white
            emailLabel.textColor = UIColor.white
            
            loginTextField.backgroundColor = UIColor.gray
            passwordTextField.backgroundColor = UIColor.gray
            confirmPasswordTextField.backgroundColor = UIColor.gray
            nameTextField.backgroundColor = UIColor.gray
            surnameTextField.backgroundColor = UIColor.gray
            birthdayTextField.backgroundColor = UIColor.gray
            emailTextField.backgroundColor = UIColor.gray
        }
        else {
            
            view.backgroundColor = UIColor.white
            
            registrateButton.backgroundColor = UIColor.blue
            
            loginLabel.textColor = UIColor.black
            passwordLabel.textColor = UIColor.black
            confirmPasswordLabel.textColor = UIColor.black
            nameLabel.textColor = UIColor.black
            surnameLabel.textColor = UIColor.black
            birthdayLabel.textColor = UIColor.black
            emailLabel.textColor = UIColor.black
            
            loginTextField.backgroundColor = UIColor.white
            passwordTextField.backgroundColor = UIColor.white
            confirmPasswordTextField.backgroundColor = UIColor.white
            nameTextField.backgroundColor = UIColor.white
            surnameTextField.backgroundColor = UIColor.white
            birthdayTextField.backgroundColor = UIColor.white
            emailTextField.backgroundColor = UIColor.white
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
