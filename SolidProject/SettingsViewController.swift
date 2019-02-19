//
//  SettingsViewController.swift
//  SolidProject
//
//  Created by Ильдар Залялов on 18/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

extension NSNotification.Name {
    
    static let changeColorNotification = NSNotification.Name.init("changeColorNotification")
}

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
    
    let notificationCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let dict = ["r": rSlider.value,
                    "g": gSlider.value,
                    "b":bSlider.value]
        
        DispatchQueue.global(qos: .background).async {
            
            self.notificationCenter.post(name: .changeColorNotification, object: self, userInfo: dict)
        }
    }

   
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
