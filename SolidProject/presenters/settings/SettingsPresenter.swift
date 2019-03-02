//
//  SettingsPresenter.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation
import UIKit

class SettingsPresenter: SettingsOutput {
    
    weak var view: SettingsInput!
    var dataManager: DataManagerProtocol!
    
    let notificationCenter = NotificationCenter.default
    
    func switchColor(index: Int) {
        switch index {
        case 0:
            view.changeIntoWhite()
             notificationCenter.post(name: NSNotification.Name.changeColorNotification, object: view, userInfo: ["color": "white"])
            break
        default:
            notificationCenter.post(name: NSNotification.Name.changeColorNotification, object: view, userInfo: ["color": "black"])
            view.changeIntoBlack()
            break
        }
    }
}
