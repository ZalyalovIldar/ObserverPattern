//
//  ProfilePresenter.swift
//  ObserverPattern
//
//  Created by Петр on 23/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

class ProfilePresenter: ProfileViewOutput {
    
 
    weak var view: ProfileViewInput!
    var dataManager: DataManagerProtocol!
    
    func setProfileInfo() {
        
        if let user = dataManager.obtainUser() {
            
            view.setProfileInfo(user)
        }
    }
    
}
