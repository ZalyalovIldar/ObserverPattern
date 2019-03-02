//
//  BaseViewController.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController {
    
    @IBOutlet weak open var scrollView: UIScrollView!
    
    /// строки
    var strings: Strings! = nil
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        registerNotifications()
    }
    
    deinit {
        printMessage(text: "deinited!!!!")
        unregisterNotifications()
    }
    
    private func registerNotifications() {
        if scrollView != nil {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(changeColor), name: .changeColorNotification, object: nil)
    }
    
    private func unregisterNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc
    func keyboardWillShow(notification: NSNotification){
        guard let keyboardFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        scrollView.contentInset.bottom = view.convert(keyboardFrame.cgRectValue, from: nil).size.height
    }
    
    @objc
    func keyboardWillHide(){
        scrollView.contentInset.bottom = 0
    }
    
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
    
    @objc
    func changeColor(notification: Notification) {
        guard let colorDict = notification.userInfo as? [String: String]
            else { return }
        let color = colorDict["color"] ?? "white"
        
        if color == "black" {
            changeIntoBlack()
        } else {
            changeIntoWhite()
        }
    }
    
    func changeIntoBlack(){}
    
    func changeIntoWhite(){}
}
