//
//  RegistrationModuleConfigurator.swift
//  ObserverPattern
//
//  Created by Петр on 24/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

import UIKit

class RegistrationModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let view = viewController as? RegistrationViewController else { fatalError() }
    
        let registrationPresenter = RegistrationPresenter()
        let dataManager = DataManager()

        view.registrationPresenter = registrationPresenter
        registrationPresenter.dataManager = dataManager
        registrationPresenter.registrationView = view
    }
    
}
