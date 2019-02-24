//
//  SettingsViewController.swift
//  ObserverPattern
//
//  Created by Петр on 23/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, SettingsViewInput {

    @IBOutlet weak var activateDarkModeSwitch: UISwitch!
    
    @IBOutlet weak var activateDarkModeLabel: UILabel!
    
    @IBOutlet weak var switchColorTheme: UISwitch!
    
    var darkModeisOn = false
    
    var settingsPresenter: SettingsViewOutput!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchColorTheme.isOn = false
        
        NotificationCenter.default.addObserver(forName: .changeColorThemeNotification, object: nil, queue: OperationQueue.main) { (notification) in
            self.changeColorTheme(notification)
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let userInfo = [darkMode : switchColorTheme.isOn]
        NotificationCenter.default.post(name: .changeColorThemeNotification, object: self, userInfo: userInfo)
    }
    
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    /// Switch dark mode handler
    ///
    /// - Parameter sender: switch
    @IBAction func changeSwitch(_ sender: UISwitch) {
        
        if sender.isOn == true {
            sender.isOn = false
        } else {
            sender.isOn = true
        }
    }
    
    /// Notification selector
    ///
    /// - Parameter notification: notification
    @objc func changeColorTheme(_ notification: Notification) {
            
        if self.switchColorTheme.isOn {
            
            view.backgroundColor = UIColor.black
            activateDarkModeLabel.textColor = UIColor.white
        }
        else {
            
            view.backgroundColor = UIColor.white
            activateDarkModeLabel.textColor = UIColor.black
        }
    }
    
}
