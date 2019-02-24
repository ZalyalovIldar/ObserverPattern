//
//  AuthorizationViewController.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController {

    /// скролл
    @IBOutlet weak var scrollView: UIScrollView!
    /// кнопка перехода к странице регистрации
    @IBOutlet weak var registrationButton: UIButton!
    /// кнопка входа
    @IBOutlet weak var loginButton: UIButton!
    /// Надпись Авторизации
    @IBOutlet weak var authLabel: UILabel!
    /// логин
    @IBOutlet weak var loginTextField: UITextField!
    /// пароль
    @IBOutlet weak var passwordTextField: UITextField!
    /// презентер, в который передаются данные
    var presenter: AuthorizationViewOutput!
    /// центр оповещений
    var notificationCenter = NotificationCenter.default
    /// константа
    var switchDict = "switch"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(forName: .changeColorNotification, object: nil, queue: OperationQueue.main) { (notification) in
            self.changeTheme(notification: notification)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    /// показать клавиатуру
    ///
    /// - Parameter notification: нотификация
    @objc private func showKeyboard(notification: Notification) {
        guard let keyboardFrameValue = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue else { return }
        let keyboardFrame = view.convert(keyboardFrameValue.cgRectValue, from: nil)
        scrollView.contentInset.bottom = keyboardFrame.size.height
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
    /// скрыть клавиатуру
    @objc private func hideKeyboard() {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
    @objc
    /// смена темы светлой/темной
    ///
    /// - Parameter notification: нотификация
    func changeTheme(notification: Notification) {
        
        guard let colorDict = notification.userInfo as? [String : Bool] else { return }
        
        if colorDict[switchDict] == true {
            
            view.backgroundColor = UIColor.darkGray
            registrationButton.backgroundColor = UIColor.white
            loginButton.backgroundColor = UIColor.white
            authLabel.textColor = UIColor.white
        } else {
            
            view.backgroundColor = UIColor.white
            registrationButton.backgroundColor = UIColor.white
            loginButton.backgroundColor = UIColor.white
            authLabel.textColor = UIColor.black
        }
    }
    
    /// Кнопка входа
    ///
    /// - Parameter sender: кнопка signInButton
    @IBAction func signInButton(_ sender: UIButton) {
        
        presenter.obtainUserAccount(login: loginTextField.text!, password: passwordTextField.text!)
    }
    
    /// кнопка перехода на страницу регистарации
    ///
    /// - Parameter sender: кнопка showRegistrationButton
    @IBAction func showRegistrationButton(_ sender: UIButton) {
        
        presenter.showRegistrationView()
    }
}
