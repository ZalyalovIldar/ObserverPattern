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
    
    func openProfileScreen(user: User) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileScreen") as! ProfileViewController; // MySecondSecreen the storyboard ID
        vc.user = user
        self.present(vc, animated: true, completion: nil);
    }
    
    @IBAction func btnSave(_ sender: Any) {
        presenter.didSavePressed(login: tiLogin.text!, password: tiPassword.text!, repeatPass: tiRepeatPassword.text!, name: tiName.text!, surname: tiSurname.text!, bDay: tiBday.text!, mail: tiMail.text!)
    }
}
