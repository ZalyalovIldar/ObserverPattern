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
    
    override func changeIntoWhite() {
        view.backgroundColor = .white
        navigationController?.navigationBar.barStyle = .default
        
        btnLogin.setTitleColor(UIColor.blue, for: .normal)
        btnRegistration.setTitleColor(UIColor.blue, for: .normal)        
    }
    
    override func changeIntoBlack() {
        view.backgroundColor = .gray
        navigationController?.navigationBar.barStyle = .black
        
        btnLogin.setTitleColor(UIColor.white, for: .normal)
        btnRegistration.setTitleColor(UIColor.white, for: .normal)
    }
}
