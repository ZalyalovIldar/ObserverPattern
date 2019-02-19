//
//  MiddleViewController.swift
//  SolidProject
//
//  Created by Ильдар Залялов on 18/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    let notificationCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(self, selector: #selector(changeLabel(notification:)), name: .changeColorNotification, object: nil)
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
    @objc
    func changeLabel(notification: Notification) {
        
        guard let colorDict = notification.userInfo as? [String : Float] else { return }
        
        let redColor = CGFloat(colorDict["r"] ?? 0)
        let greenColor = CGFloat(colorDict["g"] ?? 0)
        let blueColor = CGFloat(colorDict["b"] ?? 0)
        
        label.textColor = UIColor(red: redColor/255, green: greenColor/255, blue: blueColor/255, alpha: 1.0)
    }
    
}
