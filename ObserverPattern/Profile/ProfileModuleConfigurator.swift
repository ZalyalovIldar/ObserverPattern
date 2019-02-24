//
//  ProfileModuleConfigurator.swift
//  ObserverPattern
//
//  Created by Петр on 24/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation
import UIKit

class ProfileModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        configureModule()
    }
    
    func configureModule() {
        
        guard let view = viewController as? ProfileViewController else { fatalError() }
        
        let profilePresenter = ProfilePresenter()
        let dataManager = DataManager()

        view.profilePresenter = profilePresenter
        profilePresenter.view = view
        profilePresenter.dataManager = dataManager
    }
}
