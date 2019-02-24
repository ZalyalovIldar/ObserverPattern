//
//  RegistrationInput.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

protocol RegistrationInput: AnyObject {
    
    //отображение сообщений
    func showMessage(text: String?)
    func printMessage(text: String?)
    
    func openProfileScreen(user: User)
}
