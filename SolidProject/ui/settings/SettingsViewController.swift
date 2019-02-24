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
    
    @IBOutlet weak var darkSelector: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
