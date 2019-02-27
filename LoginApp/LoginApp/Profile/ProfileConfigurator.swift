//
//  ProfileConfigurator.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 24/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class ProfileConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        
        configureModule()
    }
    
    /// configure all patrs
    func configureModule() {
        
        guard let view = viewController as? ProfileViewController else { fatalError() }
        
        let presenter = ProfilePresenter()
        let notificationManager: NotificationManager! = NotificationManager()
        let notificationCenter = NotificationCenter.default
        
        view.presenter = presenter
        view.notoficationManager = notificationManager
        view.notificationCenter = notificationCenter
        
        presenter.view = view
     }
}

