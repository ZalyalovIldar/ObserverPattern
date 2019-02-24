//
//  DataManager.swift
//  ObserverPattern
//
//  Created by Петр on 23/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import Foundation

final class DataManager: DataManagerProtocol {
    
    private let defaults = UserDefaults.standard
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    // MARK: - Operation queues
    
    private lazy var getOperationQueue: OperationQueue = {
        
        let queue = OperationQueue()
        queue.qualityOfService = .userInteractive
        queue.name = "Get operation queue"
        
        return queue
    }()
    
    private lazy var saveOperationQueue: OperationQueue = {
        
        let queue = OperationQueue()
        queue.name = "Save operation queue"
        
        return queue
    }()
    
    
    // MARK: - Data Manager Protocol
    
    final func obtainUser() -> User? {
        
        if let encodedData = defaults.object(forKey: String(describing: User.self)) {
            
            let user = try! decoder.decode(User.self, from: encodedData as! Data) as User
            return user
        }
        
        return nil
    }
    
    final func asyncObtainUser(completionBlock: @escaping (User?) -> Void){
        
        getOperationQueue.addOperation {
            completionBlock(self.obtainUser())
        }
    }
    
    final func registrateUser(_ user: User?) {
        
        let encodedData = try? encoder.encode(user)
        defaults.set(encodedData, forKey: String(describing: User.self))
    }
    
    final func asyncRegistrateUser(_ user: User, completionBlock: @escaping (Bool) -> Void) {
        
        saveOperationQueue.addOperation {
            
            self.registrateUser(user)
            completionBlock(true)
        }
    }
}
