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
        
        // method for connecting View with Presenter
        configure()
    }
    
    func configure() {
        
        guard let view = viewController as? SettingsViewController
            else { fatalError()}
        
        let presenter = SettingsPresenter()
        let data: DataManagerProtocol = DataManager()
        let strings = Strings()
        
        // connect view, strings and dataManager to presenter
        presenter.view = view
        presenter.dataManager = data
        presenter.strings = strings
        
        
        // connect presenter to View
        view.presenter = presenter
    }
}
