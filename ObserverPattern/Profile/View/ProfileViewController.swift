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
