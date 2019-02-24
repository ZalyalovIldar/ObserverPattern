//
//  SettingsViewController.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

extension NSNotification.Name {
    
    static let changeColorNotification = NSNotification.Name.init("changeColorNotification")
}

class SettingsViewController: UIViewController {
    
    /// Надпись Настройки
    @IBOutlet weak var settingsLabel: UILabel!
    /// Описание
    @IBOutlet weak var descriptionLabel: UILabel!
    /// Свич
    @IBOutlet weak var switchTheme: UISwitch!
    /// центр оповещений
    let notificationCenter = NotificationCenter.default
    /// константа
    let switchDict = "switch"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(forName: .changeColorNotification, object: nil, queue: OperationQueue.main) { (notification) in
            self.changeTheme(notification: notification)
        }
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
    @objc
    /// поменять тему на светлую/темную
    ///
    /// - Parameter notification: нотификация
    func changeTheme(notification: Notification) {
        
        guard let colorDict = notification.userInfo as? [String : Bool] else { return }
        
        if colorDict[switchDict] == true {
            
            view.backgroundColor = UIColor.darkGray
            settingsLabel.textColor = UIColor.white
            descriptionLabel.textColor = UIColor.white
        } else {
            
            view.backgroundColor = UIColor.white
            settingsLabel.textColor = UIColor.black
            descriptionLabel.textColor = UIColor.black
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let dict = [switchDict : switchTheme.isOn]
        
        
            self.notificationCenter.post(name: .changeColorNotification, object: self, userInfo: dict)
        
    }

    /// при нажатии на switch поменять на вкл/выкл
    ///
    /// - Parameter sender: changeSwitch
    @IBAction func changeSwitch(_ sender: UISwitch) {
        
        if sender.isOn == true {
            sender.isOn = false
        } else {
            sender.isOn = true
        }
    }
}
