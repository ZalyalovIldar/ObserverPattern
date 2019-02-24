//
//  AuthorizationModuleConfigurator.swift
//  ObserverPattern
//
//  Created by Гузель on 24/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class AuthorizationModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        configureModule()
    }
    
    func configureModule() {
        
        guard let view = viewController as? AuthorizationViewController else { fatalError() }
        
        let dataBase = DataBase()
        let presenter = AuthorizationPresenter()
        let interactor = AuthorizationInteractor()
        let router = AuthorizationRouter()
        
        view.presenter = presenter
        presenter.dataBase = dataBase
        presenter.interactor = interactor
        presenter.router = router
        dataBase.presenter = presenter
        interactor.presenter = presenter
        router.view = view
    }
}
