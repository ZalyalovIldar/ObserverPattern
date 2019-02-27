//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 22/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate, LoginViewInput {
   
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enteredStatusLabel: UILabel!
    
    let identificator = "curAcc"
    
    var notificationCenter: NotificationCenter!
    var notoficationManager: NotificationManager!
    var presenter: LoginViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.delegate = self
        passwordTextField.delegate = self
        notificationCenter.addObserver(self, selector: #selector(setBlackTheme(notification:)), name: .blackTheme, object: nil)
    }
    
    deinit {
       notificationCenter.removeObserver(self)
    }
    
    /// method for setting black theme and used by notifactioncenter
    ///
    /// - Parameter notification: notification
    @objc func setBlackTheme(notification: NSNotification) {
        notoficationManager.loginViewController = self
        notoficationManager.loginBlackTheme(notification: notification)
    }
    
    func shoulPerfromSegue(withIdentifier: String, sender: Any?) {
        performSegue(withIdentifier: withIdentifier, sender: sender)
    }
    
    func setStatusLabel(_ text: String) {
        enteredStatusLabel.text = text
    }
    
    /// clear entered string
    ///
    /// - Parameter name: entered string
    func clearString(_ name: inout String) {
        name = ""
    }
    
    func clearAllTextFields() {
        clearString(&loginTextField.text!)
        clearString(&passwordTextField.text!)
        clearString(&enteredStatusLabel.text!)
    }
    
   @IBAction func enterButtonPressed(_ sender: Any) {
    
        let enteredLoginString = loginTextField.text!
        let enteredPasswordString = passwordTextField.text!
    
        presenter.loginUser(login: enteredLoginString, password: enteredPasswordString)
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == identificator, let currentAccount = sender as? Account{
            
            let destanationController = segue.destination as! ProfileViewController
            destanationController.currentAccount = currentAccount
         }
    }
   
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        loginTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
}

