//
//  SettingsViewController.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController, SettingsInput {

    var presenter: SettingsOutput! = nil
    
//    override var viewController: UIViewController! = self
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func styleSwitch(_ sender: UISegmentedControl) {
        presenter.switchColor(index: sender.selectedSegmentIndex)
    }
    
    override func changeIntoBlack() {
        view.backgroundColor = .gray
        
        self.tabBarController?.tabBar.barTintColor = UIColor.gray
        
        self.tabBarController?.tabBar.tintColor = UIColor.white
        if #available(iOS 10.0, *) {
            self.tabBarController?.tabBar.unselectedItemTintColor? = UIColor.white
        }
        
        navigationController?.navigationBar.barTintColor = UIColor.gray
    }
    
    override func changeIntoWhite() {
        view.backgroundColor = .white
        
        
        self.tabBarController?.tabBar.barTintColor = UIColor.white
        
        self.tabBarController?.tabBar.tintColor = UIColor.black
        if #available(iOS 10.0, *) {
            self.tabBarController?.tabBar.unselectedItemTintColor? = UIColor.gray
        }
    }
}
