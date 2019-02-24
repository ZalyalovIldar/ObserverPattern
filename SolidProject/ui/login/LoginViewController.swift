//
//  LoginViewController.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, LoginInput {
    
    var presenter: LoginOutput! = nil
    
    @IBOutlet weak var tiLogin: UITextField!
    @IBOutlet weak var tiPassword: UITextField!
    
    

    @IBAction func btnEnter(_ sender: Any) {
        presenter.didEnterPressed(login: tiLogin.text!, password: tiPassword.text!)
    }
    
    func showProfile(user: User) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileScreen") as! ProfileViewController; // MySecondSecreen the storyboard ID
        vc.user = user
        self.present(vc, animated: true, completion: nil);
    }
}
