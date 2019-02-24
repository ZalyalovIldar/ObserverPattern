//
//  RegistrationViewController.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    /// кнопка созранить
    @IBOutlet weak var signUpButton: UIButton!
    /// Надпить Регистрация
    @IBOutlet weak var registrationLabel: UILabel!
    /// логин
    @IBOutlet weak var loginTextField: UITextField!
    /// пароль
    @IBOutlet weak var passwordTextField: UITextField!
    /// повтор пароля
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    /// имя
    @IBOutlet weak var nameTextField: UITextField!
    /// фамилия
    @IBOutlet weak var surnameTextField: UITextField!
    /// год рождения
    @IBOutlet weak var yearOfBirthTextField: UITextField!
    /// мейл
    @IBOutlet weak var emailTextField: UITextField!
    /// скролл
    @IBOutlet weak var scrollView: UIScrollView!
    /// модель юзера
    var userModel: UserModel!
    /// презентер, куда отправляются данные для обработки
    var presenter: RegistrationViewOutput!
    /// центр оповещений
    var notificationCenter = NotificationCenter.default
    /// константа
    var switchDict = "switch"
    /// константа
    var emptyData = "Введите данные"
    var repeatPassword = "Логин и пароль не совпадают"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(forName: .changeColorNotification, object: nil, queue: OperationQueue.main) { (notification) in
            self.changeTheme(notification: notification)
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification) in
            self.showKeyboard(notification: notification)
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification) in
            self.hideKeyboard()
        }
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
    /// сменить тему на светлую/темную
    ///
    /// - Parameter notification: нотификация
    func changeTheme(notification: Notification) {
        
        guard let colorDict = notification.userInfo as? [String : Bool] else { return }
        
        if colorDict[switchDict] == true {
            
            view.backgroundColor = UIColor.darkGray
            registrationLabel.textColor = UIColor.white
            signUpButton.backgroundColor = UIColor.white
        } else {
            
            view.backgroundColor = UIColor.white
            registrationLabel.textColor = UIColor.black
            signUpButton.backgroundColor = UIColor.white
        }
    }
    
    func initModel(){
        userModel = UserModel(login: loginTextField.text!, password: passwordTextField.text!, name: nameTextField.text!, surname: surnameTextField.text!, yearOfBirth: Int(yearOfBirthTextField.text!)!, email: emailTextField.text!)
    }
    
    /// кнопка сохранения
    ///
    /// - Parameter sender: кнопка signInButton
    @IBAction func signInButton(_ sender: UIButton) {
        
        if loginTextField.text != nil && passwordTextField.text != nil && nameTextField.text != nil && surnameTextField.text != nil && yearOfBirthTextField.text != nil && emailTextField.text != nil {
            
            initModel()
        } else {
            
            presenter.showAlert(text: emptyData)
        }
        if repeatPasswordTextField.text == passwordTextField.text {
            
            presenter.checkAndSaveUserData(userModel: userModel)
        } else {
            
            presenter.showAlert(text: repeatPassword)
        }
    }
}
