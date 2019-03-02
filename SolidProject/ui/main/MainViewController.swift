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
        btnLogin.setTitleColor(UIColor.blue, for: .normal)
        btnRegistration.setTitleColor(UIColor.blue, for: .normal)
        
        
        self.tabBarController?.tabBar.barTintColor = UIColor.white
        
        self.tabBarController?.tabBar.tintColor = UIColor.black
        if #available(iOS 10.0, *) {
            self.tabBarController?.tabBar.unselectedItemTintColor? = UIColor.gray
        }
    }
    
    override func changeIntoBlack() {
        view.backgroundColor = .gray
        btnLogin.setTitleColor(UIColor.white, for: .normal)
        btnRegistration.setTitleColor(UIColor.white, for: .normal)
        
        self.tabBarController?.tabBar.barTintColor = UIColor.gray
        
        self.tabBarController?.tabBar.tintColor = UIColor.white
        if #available(iOS 10.0, *) {
            self.tabBarController?.tabBar.unselectedItemTintColor? = UIColor.white
        }
    }
}
