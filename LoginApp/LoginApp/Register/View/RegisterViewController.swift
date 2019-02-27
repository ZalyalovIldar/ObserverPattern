//
//  RegisterViewController.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 22/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate, RegisterViewInput {
   
    @IBOutlet weak var contentScrollView: UIScrollView!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatedPasswordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var secNameTextField: UITextField!
    @IBOutlet weak var birthYearTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var repeatedPasswordLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var yearOfBirthLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var registrationStatusLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var notificationCenter: NotificationCenter!
    var notoficationManager: NotificationManager!
    var presenter: RegisterViewOutput!
    
    
    
   override func viewDidLoad() {
        super.viewDidLoad()
        
       notificationCenter.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(setRegisterBlackTheme(notification:)), name: .blackTheme, object: nil)
    
        notoficationManager.registerViewController = self
        loginTextField.delegate = self
        passwordTextField.delegate = self
        repeatedPasswordTextField.delegate = self
        nameTextField.delegate = self
        secNameTextField.delegate = self
        emailTextField.delegate = self
        birthYearTextField.delegate = self
        phoneNumberTextField.delegate = self
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
    /// used for notification center
    ///when keyboard show
    /// - Parameter notification: notification
    @objc func keyboardWillShow(notification: NSNotification) {
        notoficationManager.registerKeyboardShow(notification: notification)
    }
    
    /// used fro notification  center
    ///when keyboard hide
    /// - Parameter notification: notifications
    @objc func keyboardWillHide(notification: NSNotification) {
        notoficationManager.registerKeyboardHide(notification: notification)
    }
    
    /// used fro notification  center
    /// set register profile blaack theme
    /// - Parameter notification: notification
    @objc func setRegisterBlackTheme(notification: NSNotification) {
        notoficationManager.registerBlackTheme(notification: notification)
    }
    
    func popViewController() {
         self.navigationController?.popViewController(animated: true)
    }
    
    func setStatus(_ text: String) {
         registrationStatusLabel.text = text
    }
    
    
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        
        self.loginTextField.endEditing(true)
        self.passwordTextField.endEditing(true)
        self.repeatedPasswordTextField.endEditing(true)
        self.nameTextField.endEditing(true)
        self.secNameTextField.endEditing(true)
        self.emailTextField.endEditing(true)
        self.birthYearTextField.endEditing(true)
        self.phoneNumberTextField.endEditing(true)
        return true
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        
        let loginString            = loginTextField.text!
        let passwordString         = passwordTextField.text!
        let repeatedPasswordString = repeatedPasswordTextField.text!
        let nameString             = nameTextField.text!
        let secNameString          = secNameTextField.text!
        let birthYearString        = birthYearTextField.text!
        let emailString            = emailTextField.text!
        let phoneNumberString      = phoneNumberTextField.text!
        
        presenter.registerNewAccount(login: loginString,
                                     password: passwordString,
                                     repeatedPassword: repeatedPasswordString,
                                     name: nameString,
                                     secName: secNameString,
                                     email: emailString,
                                     yearOfBirth: birthYearString,
                                     phoneNumber: phoneNumberString)
    }
}
    

