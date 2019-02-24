//
//  SettingsModuleConfigurator.swift
//  ObserverPattern
//
//  Created by Петр on 24/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class SettingsModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let view = viewController as? SettingsViewController else { fatalError() }

        let settingsPresenter = SettingsPresenter()

        view.settingsPresenter = settingsPresenter
        settingsPresenter.view = view
    }
}
