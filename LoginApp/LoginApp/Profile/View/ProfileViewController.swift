//
//  ProfileViewController.swift
//  LoginApp
//
//  Created by Александр Арсенюк on 22/02/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, ProfileViewInput {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameLabelValue: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var secondNameLabelValue: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginLabelValue: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailLabelValue: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabelValue: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var phoneNumberLabelValue: UILabel!
    
    var notificationCenter: NotificationCenter!
    var presenter: ProfileViewOutput!
    var notoficationManager: NotificationManager!
    var currentAccount: Account?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(self, selector: #selector(setProfileBlackTheme(notification:)), name: .blackTheme, object: nil)
   }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.sendUser(currentAccount!)
    }
    
    func setUserData(login: String, name: String, secondName: String, phone: String, email: String, yearOfBirth: String) {
        nameLabelValue.text = name
        secondNameLabelValue.text = secondName
        loginLabelValue.text = login
        emailLabelValue.text = email
        dateOfBirthLabelValue.text = yearOfBirth
        phoneNumberLabelValue.text = phone
    }
    
    /// set profile view controller
    ///
    /// - Parameter notification: notification
    @objc func setProfileBlackTheme(notification: NSNotification) {
        
        notoficationManager.profileViewConroller = self
        notoficationManager.profileBlackTheme(notification: notification)
    }
        
    deinit {
        notificationCenter.removeObserver(self)
    }
}
