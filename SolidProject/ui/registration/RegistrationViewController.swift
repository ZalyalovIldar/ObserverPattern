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
    
    @IBOutlet weak var viewHolder: UIView!
    @IBOutlet weak var test: UILabel!
    
    fileprivate let profileSegue = "regProfileSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func openProfileScreen(user: User) {
        performSegue(withIdentifier: profileSegue, sender: user)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == profileSegue, let user = sender as? User {
            let destinationController = segue.destination as! ProfileViewController
            destinationController.user = user
        }
    }
    
    @IBAction func btnSave(_ sender: Any) {
        presenter.didSavePressed(login: tiLogin.text!, password: tiPassword.text!, repeatPass: tiRepeatPassword.text!, name: tiName.text!, surname: tiSurname.text!, bDay: tiBday.text!, mail: tiMail.text!)
    }
    
    override func changeIntoBlack() {
        view.backgroundColor = .gray
        viewHolder.backgroundColor = .gray    
    }

    override func changeIntoWhite() {
        view.backgroundColor = .white
        viewHolder.backgroundColor = .white
    }
}
