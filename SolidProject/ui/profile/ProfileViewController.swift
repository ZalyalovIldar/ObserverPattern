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
    
    @IBOutlet weak var tvLogin: UILabel!
    @IBOutlet weak var tvName: UILabel!
    @IBOutlet weak var tvSurname: UILabel!
    @IBOutlet weak var tvBDay: UILabel!
    @IBOutlet weak var tvMail: UILabel!

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showProfile()
    }
    
    /// отображения данных о пользователе
    func showProfile() {
        tvLogin.text = user.login
        tvName.text = user.name
        tvSurname.text = user.surname
        tvBDay.text = user.bDay
        tvMail.text = user.mail
    }
    
    /// смена цвета экрана на темный
    override func changeIntoBlack() {
        view.backgroundColor = .gray
    }
    
    /// смена цвета экрана на светлый
    override func changeIntoWhite() {
        view.backgroundColor = .white
    }
}
