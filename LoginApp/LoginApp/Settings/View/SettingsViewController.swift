//
//  SettingsViewController.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 22/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {
   
    @IBOutlet weak var blackThemeSwitch: UISwitch!
    @IBOutlet weak var blackThemeLabel: UILabel!
    
    var notificationCenter: NotificationCenter!
    var notoficationManager: NotificationManager!
    var presenter: SettingsViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.addObserver(self, selector: #selector(setSettingsBlackTheme(notification:)), name: .blackTheme, object: nil)
    }
    
    @IBAction func blackThemeSwitched(_ sender: Any) {
       
        let isSwitched = blackThemeSwitch.isOn
        presenter.sendBlackThemeNotification(isOn: isSwitched)
     }
    
     /// set black theme for settings view controler
     /// used by notification center
     /// - Parameter notification: notification
     @objc func setSettingsBlackTheme(notification: NSNotification) {
       
        notoficationManager.setiingsViewContorller = self
        notoficationManager.settingsBalckTheme(notification: notification)
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
}
