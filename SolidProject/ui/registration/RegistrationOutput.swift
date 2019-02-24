//
//  RegistrationOutput.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

protocol RegistrationOutput {
    
    func didSavePressed(login: String, password: String, repeatPass: String,
                        name: String, surname: String, bDay: String, mail: String)
}
