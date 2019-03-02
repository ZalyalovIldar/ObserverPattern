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
    
    @IBOutlet weak var viewHolder: UIView!
    
    fileprivate var profileSegue = "logProfileSegue"
    
    @IBAction func btnEnter(_ sender: Any) {
        presenter.didEnterPressed(login: tiLogin.text!, password: tiPassword.text!)
    }
    
    func showProfile(user: User) {
        performSegue(withIdentifier: profileSegue, sender: user)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == profileSegue, let user = sender as? User {
            let destinationController = segue.destination as! ProfileViewController
            destinationController.user = user
        }
    }
    
    override func changeIntoWhite() {
        view.backgroundColor = .white
        viewHolder.backgroundColor = .white        
    }
    
    override func changeIntoBlack() {
        view.backgroundColor = .gray
        viewHolder.backgroundColor = .gray
    }
}
