//
//  SettingsPresenter.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 24/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

class SettingsPresenter: SettingsViewOutput {
    
        var view = SettingsViewController()
        let notificationCenter = NotificationCenter.default
    
    func sendBlackThemeNotification(isOn: Bool) {
        
        let dict = ["blackTheme" : isOn]
        
        notificationCenter.post(name: .blackTheme, object: view , userInfo: dict)
    }
    
    
}
