//
//  MainViewController.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet weak var ttlNavigatinItem: UINavigationItem!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegistration: UIButton!
    
    /// метод для установки обычного режима
    override func changeIntoWhite() {
        view.backgroundColor = .white
        navigationController?.navigationBar.barStyle = .default
        
         //смена цвета текста кнопок
        btnLogin.setTitleColor(UIColor.blue, for: .normal)
        btnRegistration.setTitleColor(UIColor.blue, for: .normal)        
    }
    
    /// метод для установки темного режим
    override func changeIntoBlack() {
        view.backgroundColor = .gray
        navigationController?.navigationBar.barStyle = .black
        
        
        // смена цвета текста кнопок
        btnLogin.setTitleColor(UIColor.white, for: .normal)
        btnRegistration.setTitleColor(UIColor.white, for: .normal)
    }
}
