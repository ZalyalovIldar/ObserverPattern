//
//  SettingsPresenter.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

class SettingsPresenter: SettingsOutput {
    
    weak var view: SettingsInput!
    var dataManager: DataManagerProtocol!
}
