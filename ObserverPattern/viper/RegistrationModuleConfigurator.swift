//
//  RegistrationModuleConfigurator.swift
//  ObserverPattern
//
//  Created by Гузель on 24/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
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
        
        let dataBase = DataBase()
        let presenter = RegistrationPresenter()
        let interactor = RegistrationInteractor()
        let router = RegistrationRouter()
        
        view.presenter = presenter
        presenter.dataBase = dataBase
        presenter.interactor = interactor
        presenter.view = router
        interactor.presenter = presenter
        router.view = view
        dataBase.presenter = presenter
    }
}
