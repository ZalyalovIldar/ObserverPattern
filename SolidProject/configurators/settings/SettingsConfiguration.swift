//
//  SettingsConfiguration.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation
import UIKit

class SettingsConfiguration: NSObject {
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        configure()
    }
    
    func configure() {
        
        guard let view = viewController as? SettingsViewController
            else { fatalError()}
        
        let presenter = SettingsPresenter()
        let data: DataManagerProtocol = DataManager()
        
        //connect view, strings and dataManager to presenter
        presenter.view = view
        presenter.dataManager = data
        
        
        //connect presenter and strings to View
        view.presenter = presenter
    }
}
