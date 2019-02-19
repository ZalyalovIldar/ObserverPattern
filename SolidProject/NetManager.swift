//
//  NetManager.swift
//  SolidProject
//
//  Created by Ильдар Залялов on 18/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

///S
protocol NetManager {
    
    func obtainItemsFromNetwork() -> URLRequest
    
    func calculate(_ a: Int, _ b: Int) -> Int
}

/// O - open closed
protocol NetManager2 {
    
    func obtainItemsFromNetwork(items: [String], with stateCount: Int)
    
    func calculate(_ a: Int, _ b: Int) -> Int
}

/// L
class NetManagerImpl: NetManager2 {
    
    func obtainItemsFromNetwork(items: [String], with stateCount: Int)  {
        
    }
    
    func calculate(_ a: Int, _ b: Int) -> Int {
        return 5
    }
}

class NetManagerImpl2: NetManagerImpl {
    
    override func obtainItemsFromNetwork(items: [String], with stateCount: Int) {
        
        guard items.count > stateCount else { return }
        
    }
}


