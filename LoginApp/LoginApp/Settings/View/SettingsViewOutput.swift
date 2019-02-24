//
//  SettingsViewOutput.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 24/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

/// protocol discribes settings view input methods
protocol SettingsViewOutput: AnyObject {
    
    /// set black theme for settings viewcontroller
    ///
    /// - Parameter isOn: switch is on
    func sendBlackThemeNotification(isOn: Bool )
}

