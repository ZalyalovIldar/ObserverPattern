//
//  BaseViewController.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

/// базовый ViewController, для предотвращения дублирования кода
open class BaseViewController: UIViewController {
    
    @IBOutlet weak open var scrollView: UIScrollView!
    
    /// строки
    var strings: Strings! = Strings()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        registerNotifications()
    }
    
    deinit {
        unregisterNotifications()
    }
    
    // MARK: - notifications
    
    /// влючает прослушку на открытие клавиатуры и изменение в настройках цвета
    private func registerNotifications() {
        if scrollView != nil {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(changeColor), name: .changeColorNotification, object: nil)
    }
    
    /// отключает прослушки
    private func unregisterNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc
    /// если клавиатура открылась, двигаем scrollView вверх
    func keyboardWillShow(notification: NSNotification){
        guard let keyboardFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        scrollView.contentInset.bottom = view.convert(keyboardFrame.cgRectValue, from: nil).size.height
    }
    
    @objc
    /// если клавиатура закрылась, двигаем scrollView вниз
    func keyboardWillHide(){
        scrollView.contentInset.bottom = 0
    }
    
    @objc
    /// меняем цвет в зависимости от того, что пришло в notification
    func changeColor(notification: Notification) {
        guard let colorDict = notification.userInfo as? [String: String]
            else { return }
        let color = colorDict[strings.color_title] ?? strings.color_white
        
        if color == strings.color_black {
            changeIntoBlack()
        } else {
            changeIntoWhite()
        }
    }
    
    ///  меняем цвет на черный
    func changeIntoBlack() { }
    
    ///  меняем цвет на белый
    func changeIntoWhite() { }
    
    // MARK: - сообщения
    
    /// Методя печатающий сообщения для разработчиков
    ///
    /// - Parameter text: сообщение, String
    func printMessage(text: String?) {
        print(text!)
    }
    
    /// отображение алерт диалога
    ///
    /// - Parameter text: текст сообщения
    func showMessage(text: String?) {
        let alert = UIAlertController(title: strings.alert_title, message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: strings.alert_ok, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
