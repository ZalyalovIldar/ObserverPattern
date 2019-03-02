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
        
        self.tabBarController?.tabBar.barStyle = .black
    }
    
    override func changeIntoWhite() {
        view.backgroundColor = .white
        
        self.tabBarController?.tabBar.barStyle = .default
    }
}
