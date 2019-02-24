//
//  RegistrationViewController.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

class RegistrationViewController: BaseViewController, RegistrationInput {
    
    var presenter: RegistrationOutput! = nil
    
    @IBOutlet weak var tiLogin: UITextField!
    @IBOutlet weak var tiPassword: UITextField!
    @IBOutlet weak var tiRepeatPassword: UITextField!
    @IBOutlet weak var tiName: UITextField!
    @IBOutlet weak var tiSurname: UITextField!
    @IBOutlet weak var tiBday: UITextField!
    @IBOutlet weak var tiMail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSave(_ sender: Any) {
        presenter.didSavePressed(login: tiLogin.text!, password: tiPassword.text!, repeatPass: tiRepeatPassword.text!, name: tiName.text!, surname: tiSurname.text!, bDay: tiBday.text!, mail: tiMail.text!)
    }
}
