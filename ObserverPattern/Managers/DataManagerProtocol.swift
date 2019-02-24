//
//  DataManagerProtocol.swift
//  ObserverPattern
//
//  Created by Петр on 24/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

protocol DataManagerProtocol {
    
    /// Return current user
    ///
    /// - Returns: current user
    func obtainUser() -> User?
    
    /// Async version
    ///
    /// - Parameter completionBlock: to return user
    /// - Returns: user
    func asyncObtainUser(completionBlock: @escaping (User?) -> Void)
    
    /// Save new user in UserDefaults
    ///
    /// - Parameter user: currentUser
    func registrateUser(_ user: User?)
    
    /// Async version
    ///
    /// - Parameters:
    ///   - user: current user
    ///   - completionBlock: result of process
    func asyncRegistrateUser(_ user: User, completionBlock: @escaping (Bool) -> Void)
}
