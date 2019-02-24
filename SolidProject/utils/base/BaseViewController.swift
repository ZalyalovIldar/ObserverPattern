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
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if scrollView != nil {
            registerNotifications()
        }
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if scrollView != nil {
            unregisterNotifications()
        }
    }
    
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func unregisterNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
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
}
