//
//  SettingsConfigurator.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 24/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class SettingsConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        configureModule()
    }
    
    /// configure all models
    func configureModule() {
        
        guard let view = viewController as? SettingsViewController else { fatalError() }
        
        let presenter = SettingsPresenter()
        let notificationManager: NotificationManager! = NotificationManager()
        
        
        view.presenter = presenter
        view.notoficationManager = notificationManager
        
        
        
        
        
    }
}


