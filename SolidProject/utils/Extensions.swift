//
//  Extensions.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

private var changeColorNotivication = "changeColorNotification"

// расширения для ViewController'a для закрытия клавиатуры после нажатия на экран
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// расширения для Notification.Name для добавления необходимого имени
extension Notification.Name {
    static let changeColorNotification = NSNotification.Name.init(changeColorNotivication)
}
