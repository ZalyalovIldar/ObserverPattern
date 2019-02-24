//
//  ProfileViewController.swift
//  ObserverPattern
//
//  Created by Петр on 23/02/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, ProfileViewInput {
    
    // Avatar image
    @IBOutlet weak var avatarImageView: UIImageView!
    
    // User's nickname
    @IBOutlet weak var nicknameLabel: UILabel!
    
    // Date of birth
    @IBOutlet weak var birthdayLabel: UILabel!
    
    // User's email
    @IBOutlet weak var emailLabel: UILabel!
    
    // Name and surname
    @IBOutlet weak var nameSurnameLabel: UILabel!
    
    /// Presenter
    var profilePresenter: ProfileViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profilePresenter.setProfileInfo()
        
        NotificationCenter.default.addObserver(forName: .changeColorThemeNotification, object: nil, queue: OperationQueue.main) { (notification) in
            self.setColorTheme(notification)
        }
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    
    /// Theme setter
    ///
    /// - Parameter notification: notification
    @objc func setColorTheme(_ notification: Notification) {
        
        guard let userInfo = notification.userInfo as? [String : Bool] else { return }
        
        if userInfo[darkMode] ?? false {
            
            view.backgroundColor = UIColor.black
            
            emailLabel.textColor = UIColor.white
            nameSurnameLabel.textColor = UIColor.white
            birthdayLabel.textColor = UIColor.white
            nicknameLabel.textColor = UIColor.white
            
        } else {
            
            view.backgroundColor = UIColor.white
            
            emailLabel.textColor = UIColor.black
            nameSurnameLabel.textColor = UIColor.black
            birthdayLabel.textColor = UIColor.black
            nicknameLabel.textColor = UIColor.black
        }
    }
    
    
    // MARK: - ProfileViewInput
    
    func setProfileInfo(_ user: User?) {
        
        guard let currentUser = user else { return }
        
        nicknameLabel.text = currentUser.nickname
        birthdayLabel.text = currentUser.birthday
        emailLabel.text = currentUser.email
        nameSurnameLabel.text = (currentUser.name ?? "") + " " + (currentUser.surname ?? "")
    
    }
    
}
