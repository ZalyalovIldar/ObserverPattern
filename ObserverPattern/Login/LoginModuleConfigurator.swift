//
//  LoginModuleConfigurator.swift
//  ObserverPattern
//
//  Created by Петр on 24/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class LoginModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let view = viewController as? LoginViewController else { fatalError() }

        let presenter = LoginPresenter()
        let dataManager = DataManager()

        presenter.loginView = view
        view.loginPresenter = presenter
        presenter.dataManager = dataManager
    }
}
