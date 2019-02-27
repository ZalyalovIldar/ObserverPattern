//
//  NotificationsManager.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 24/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

/// protoloc used for notifications methods
protocol NotificationManagerProtocol {
    
    /// method for setting black theme at settings VC
    ///
    /// - Parameter notification: notifiactions
    func settingsBalckTheme(notification: NSNotification)
    
    /// method for setting black theme at login VC
    ///
    /// - Parameter notification: notifications
    func loginBlackTheme(notification: NSNotification)
    
    /// method for setting black theme at profile profile VC
    ///
    /// - Parameter notification: notofofcations
    func profileBlackTheme(notification: NSNotification)
    
    /// method for setting black theme at register VC
    ///
    /// - Parameter notification: notification
    func registerBlackTheme(notification: NSNotification)
    
    /// methot used for increasing constraint
    /// between last element on view and bottom when keyboard showed
    /// - Parameter notification: notification
    func registerKeyboardShow(notification: NSNotification)
    
    /// methot used for decreasing constraint
    /// between last element on view and bottom when keyboard hide
    /// - Parameter notification: notification
    func registerKeyboardHide(notification: NSNotification)
}

class NotificationManager: NotificationManagerProtocol {
    
    let blackTheme = "blackTheme"
    
    var setiingsViewContorller: SettingsViewController!
    var loginViewController: LoginViewController!
    var profileViewConroller: ProfileViewController!
    var registerViewController: RegisterViewController!
    
    let notificationCenter = NotificationCenter.default
    
    func settingsBalckTheme(notification: NSNotification) {
       
        let navigationBar = setiingsViewContorller.navigationController?.navigationBar
        
        guard let blackThemeDict = notification.userInfo as? [String : Bool] else {return}
        
        let value = Bool(blackThemeDict[blackTheme] ?? false)
        
        if value == true {
            
            setiingsViewContorller.view.backgroundColor? = .darkGray
            setiingsViewContorller.blackThemeLabel.textColor = .white
            navigationBar?.barStyle = .black
            navigationBar?.tintColor = .white
        } else {
            
            setiingsViewContorller.view.backgroundColor? = .white
            setiingsViewContorller.blackThemeLabel.textColor = .black
            navigationBar?.barStyle = .default
            navigationBar?.tintColor = .black
        }
    }
    
    func loginBlackTheme(notification: NSNotification) {
        
        let navigationBar = loginViewController.navigationController?.navigationBar
        let tabBar = loginViewController.tabBarController?.tabBar
        
        guard let blackThemeDict = notification.userInfo as? [String : Bool] else {return}
        
        let value = Bool(blackThemeDict[blackTheme] ?? false)
        
        if value == true {
            
            loginViewController.view.backgroundColor? = .darkGray
            loginViewController.registerButton.titleLabel?.textColor = .white
            loginViewController.registerButton.setTitleColor(.white, for: UIControl.State.init(rawValue: 0))
            loginViewController.loginLabel.textColor = .white
            loginViewController.passwordLabel.textColor = .white
            loginViewController.enterButton.titleLabel?.textColor = .white
            loginViewController.enterButton.setTitleColor(.white, for: UIControl.State.init(rawValue: 0))
            navigationBar?.barStyle = .black
            navigationBar?.tintColor = .white
            tabBar?.barStyle = .black
            tabBar?.tintColor = .white
            loginViewController.loginTextField.keyboardAppearance = .dark
            loginViewController.passwordTextField.keyboardAppearance = .dark
        } else {
            
            loginViewController.view.backgroundColor? = .white
            loginViewController.registerButton.titleLabel?.textColor = .black
            loginViewController.registerButton.setTitleColor(.black, for: UIControl.State.init(rawValue: 0))
            loginViewController.loginLabel.textColor = .black
            loginViewController.passwordLabel.textColor = .black
            loginViewController.enterButton.titleLabel?.textColor = .black
            loginViewController.enterButton.setTitleColor(.black, for: UIControl.State.init(rawValue: 0))
            navigationBar?.barStyle = .default
            navigationBar?.tintColor = .black
            tabBar?.barStyle = .default
            tabBar?.tintColor = .black
            loginViewController.loginTextField.keyboardAppearance = .default
            loginViewController.passwordTextField.keyboardAppearance = .default
        }

    }
    
    func profileBlackTheme(notification: NSNotification) {
        
        guard let blackThemeDict = notification.userInfo as? [String : Bool] else {return}
        
        let value = Bool(blackThemeDict[blackTheme] ?? false)
        
        if value == true {
            
            profileViewConroller.view.backgroundColor? = .darkGray
            profileViewConroller.nameLabel.textColor = .white
            profileViewConroller.nameLabelValue.textColor = .white
            profileViewConroller.secondNameLabel.textColor = .white
            profileViewConroller.secondNameLabelValue.textColor = .white
            profileViewConroller.loginLabel.textColor = .white
            profileViewConroller.loginLabelValue.textColor = .white
            profileViewConroller.emailLabel.textColor = .white
            profileViewConroller.emailLabelValue.textColor = .white
            profileViewConroller.dateOfBirthLabel.textColor = .white
            profileViewConroller.dateOfBirthLabelValue.textColor = .white
            profileViewConroller.phoneNumberLabel.textColor = .white
            profileViewConroller.phoneNumberLabelValue.textColor = .white
        } else {
            
            profileViewConroller.view.backgroundColor? = .white
            profileViewConroller.nameLabel.textColor = .black
            profileViewConroller.nameLabelValue.textColor = .black
            profileViewConroller.secondNameLabel.textColor = .black
            profileViewConroller.secondNameLabelValue.textColor = .black
            profileViewConroller.loginLabel.textColor = .black
            profileViewConroller.loginLabelValue.textColor = .black
            profileViewConroller.emailLabel.textColor = .black
            profileViewConroller.emailLabelValue.textColor = .black
            profileViewConroller.dateOfBirthLabel.textColor = .black
            profileViewConroller.dateOfBirthLabelValue.textColor = .black
            profileViewConroller.phoneNumberLabel.textColor = .black
            profileViewConroller.phoneNumberLabelValue.textColor = .black
        }
    }
    
    func registerBlackTheme(notification: NSNotification) {
        
        guard let blackThemeDict = notification.userInfo as? [String : Bool] else {return}
        
        let value = Bool(blackThemeDict[blackTheme] ?? false)
        
        if value == true {
            
            registerViewController.view.backgroundColor? = .darkGray
            registerViewController.loginLabel.textColor = .white
            registerViewController.passwordLabel.textColor = .white
            registerViewController.repeatedPasswordLabel.textColor = .white
            registerViewController.nameLabel.textColor = .white
            registerViewController.secondNameLabel.textColor = .white
            registerViewController.yearOfBirthLabel.textColor = .white
            registerViewController.emailLabel.textColor = .white
            registerViewController.phoneNumberLabel.textColor = .white
            registerViewController.registerButton.titleLabel?.textColor = .white
            registerViewController.loginTextField.keyboardAppearance = .dark
            registerViewController.passwordTextField.keyboardAppearance = .dark
            registerViewController.repeatedPasswordTextField.keyboardAppearance = .dark
            registerViewController.nameTextField.keyboardAppearance = .dark
            registerViewController.secNameTextField.keyboardAppearance = .dark
            registerViewController.emailTextField.keyboardAppearance = .dark
            registerViewController.birthYearTextField.keyboardAppearance = .dark
            registerViewController.phoneNumberTextField.keyboardAppearance = .dark
        } else {
            
            registerViewController.view.backgroundColor? = .white
            registerViewController.loginLabel.textColor = .black
            registerViewController.passwordLabel.textColor = .black
            registerViewController.repeatedPasswordLabel.textColor = .black
            registerViewController.nameLabel.textColor = .black
            registerViewController.secondNameLabel.textColor = .black
            registerViewController.yearOfBirthLabel.textColor = .black
            registerViewController.emailLabel.textColor = .black
            registerViewController.phoneNumberLabel.textColor = .black
            registerViewController.registerButton.titleLabel?.textColor = .black
            registerViewController.loginTextField.keyboardAppearance = .default
            registerViewController.passwordTextField.keyboardAppearance = .default
            registerViewController.repeatedPasswordTextField.keyboardAppearance = .default
            registerViewController.nameTextField.keyboardAppearance = .default
            registerViewController.secNameTextField.keyboardAppearance = .default
            registerViewController.emailTextField.keyboardAppearance = .default
            registerViewController.birthYearTextField.keyboardAppearance = .default
            registerViewController.phoneNumberTextField.keyboardAppearance = .default
        }
    }
    
    func registerKeyboardShow(notification: NSNotification) {
        
        if registerViewController.view.frame.origin.y == 0 {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue{
            registerViewController.bottomConstraint.constant = keyboardSize.height
            registerViewController.view.frame.origin.y -= 1
            }
        }
    }
    
    func registerKeyboardHide(notification: NSNotification) {
        
        if registerViewController.view.frame.origin.y != 0 {
            registerViewController.view.frame.origin.y = 0
            registerViewController.bottomConstraint.constant = 10
        }
    }
}
    

