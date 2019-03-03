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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /// метод для установки темного режима
    override func changeIntoBlack() {
        view.backgroundColor = .gray
        
        //настройка стиля tabBar
        self.tabBarController?.tabBar.barStyle = .black
    }
    
    /// метод для установки обычного режима
    override func changeIntoWhite() {
        view.backgroundColor = .white
        
        // настройка стиля tabBar
        self.tabBarController?.tabBar.barStyle = .default
    }
    
    /// переключатель цвета приложения
    @IBAction func styleSwitch(_ sender: UISegmentedControl) {
        presenter.switchColor(index: sender.selectedSegmentIndex)
    }
}
