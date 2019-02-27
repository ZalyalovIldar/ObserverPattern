//
//  LoginConfigurator.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 24/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit


class LoginConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        configureModule()
    }
    
    /// configure all elemnts
    func configureModule() {
        
        guard let view = viewController as? LoginViewController else { fatalError() }
        
        let presenter = LoginPresenter()
        let notificationManager: NotificationManager = NotificationManager()
        let notificationCenter = NotificationCenter.default
        
        view.presenter = presenter
        view.notoficationManager = notificationManager
        view.notificationCenter = notificationCenter
        
        presenter.view = view
    }
}


