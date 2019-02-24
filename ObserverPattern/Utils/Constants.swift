//
//  Constants.swift
//  ObserverPattern
//
//  Created by Петр on 23/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

enum State {
    case login
    case registration
    case profile
}

let wrongFields = "Поля неправильно заполнены"
let firstlyRegistrate = "Зарегистрируйтесь"
let darkMode = "darkMode"

enum Identifiers: String {
    case main = "Main"
    case profile = "Profile"
}
