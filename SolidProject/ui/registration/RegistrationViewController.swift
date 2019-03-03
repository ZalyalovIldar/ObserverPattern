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
    
    fileprivate let profileSegue = "regProfileSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    func openProfileScreen(user: User) {
        performSegue(withIdentifier: profileSegue, sender: user)
    }
    
    /// подготовка необходимых данных для отправки на другой экран
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == profileSegue, let user = sender as? User {
            let destinationController = segue.destination as! ProfileViewController
            destinationController.user = user
        }
    }
    
    //MARK: - цвет
    
    /// смена стиля экрана на темный
    override func changeIntoBlack() {
        changeBackgroundColor(color: .gray)
        changeKeyboardAppearence(style: .dark)
    }
    
    /// смена стиля экрана на белый
    override func changeIntoWhite() {
        changeBackgroundColor(color: .white)
        changeKeyboardAppearence(style: .default)
    }
    
    /// смена цвета компонентов
    ///
    /// - Parameter color: необходимый цвет
    func changeBackgroundColor(color: UIColor) {
        view.backgroundColor = color
        viewHolder.backgroundColor = color
    }
    
    /// смена цвета клавиатуры
    ///
    /// - Parameter style: необходимый стиль
    func changeKeyboardAppearence(style: UIKeyboardAppearance)  {
        tiLogin.keyboardAppearance = style
        tiPassword.keyboardAppearance = style
        tiRepeatPassword.keyboardAppearance = style
        tiName.keyboardAppearance = style
        tiSurname.keyboardAppearance = style
        tiBday.keyboardAppearance = style
        tiMail.keyboardAppearance = style
    }
    
    /// метод нажатия на кнопку сохранения пользователя
    @IBAction func btnSave(_ sender: Any) {
        presenter.didSavePressed(login: tiLogin.text!, password: tiPassword.text!, repeatPass: tiRepeatPassword.text!, name: tiName.text!, surname: tiSurname.text!, bDay: tiBday.text!, mail: tiMail.text!)
    }
}
