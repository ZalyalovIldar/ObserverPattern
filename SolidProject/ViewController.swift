//
//  ViewController.swift
//  SolidProject
//
//  Created by Ильдар Залялов on 18/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

///SOLID

/// S - single responsibility

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var netManager: NetManager!
    var tableView: UITableView!
    
    let notificationCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(forName: .changeColorNotification, object: nil, queue: OperationQueue.main) { (notification) in
            self.changeLabel(notification: notification)
        }
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

extension UIView {
    
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set(newValue) { self.layer.cornerRadius = newValue }
        get { return self.layer.cornerRadius }
    }
    
    var x: CGFloat {
        get { return self.frame.origin.x }
        set { self.frame.origin.x = newValue }
    }
}

extension UITableViewCell {
    
    static var customNib: UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static var customIdentifier: String {
        return String(describing: self)
    }
}

extension ViewController {
    
}

