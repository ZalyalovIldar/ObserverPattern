//
//  LoginOutput.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

protocol LoginOutput {
    
    func didEnterPressed(login: String, password: String)
}
