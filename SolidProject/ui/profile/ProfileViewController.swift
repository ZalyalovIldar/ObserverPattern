//
//  ProfileViewController.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController, ProfileInput {
    
    var presenter: ProfileOutput! = nil
    var user: User!

    @IBOutlet weak var tvLogin: UILabel!
    @IBOutlet weak var tvName: UILabel!
    @IBOutlet weak var tvSurname: UILabel!
    @IBOutlet weak var tvBDay: UILabel!
    @IBOutlet weak var tvMail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showProfile()
    }
    
    func showProfile() {
        tvLogin.text = user.login
        tvName.text = user.name
        tvSurname.text = user.surname
        tvBDay.text = user.bDay
        tvMail.text = user.mail
    }
    
    override func changeIntoBlack() {
        view.backgroundColor = .gray
    }
    
    override func changeIntoWhite() {
        view.backgroundColor = .white
    }
}
