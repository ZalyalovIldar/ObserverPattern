//
//  ProfilePresenter.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

class ProfilePresenter: ProfileOutput {    
    
    weak var view: ProfileInput!
    var dataManager: DataManagerProtocol!
    var strings: Strings!
}
