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
    var strings: Strings!
    
    let notificationCenter = NotificationCenter.default
    
    /// метод при переключении цвета
    ///
    /// - Parameter index: индекс переключателя
    func switchColor(index: Int) {
        switch index {
            
            case 0:
    //            меняем насстройки на белый
                notificationCenter.post(name: NSNotification.Name.changeColorNotification, object: view, userInfo: [strings.color_title: strings.color_white])
                break
            
            default:
                notificationCenter.post(name: NSNotification.Name.changeColorNotification, object: view, userInfo: [strings.color_title: strings.color_black])
//                view.changeIntoBlack()
                break
        }
    }
}
