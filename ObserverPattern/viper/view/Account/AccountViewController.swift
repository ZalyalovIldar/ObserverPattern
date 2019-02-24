//
//  AccountViewController.swift
//  NotificationCenter
//
//  Created by Гузель on 23/02/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    /// имя
    @IBOutlet weak var nameLabel: UILabel!
    /// фамилия
    @IBOutlet weak var surnameLabel: UILabel!
    /// год рождения
    @IBOutlet weak var yearOldLabel: UILabel!
    /// мейл
    @IBOutlet weak var emailLabel: UILabel!
    /// логин
    @IBOutlet weak var loginLabel: UILabel!
    /// модель пользователя
    var userModel: UserModel!
    /// центр оповещений
    var notificationCenter = NotificationCenter.default
    /// константа
    var switchDict = "switch"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        notificationCenter.addObserver(forName: .changeColorNotification, object: nil, queue: OperationQueue.main) { (notification) in
            self.changeTheme(notification: notification)
        }
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
    @objc
    /// Смена темы светлой/темной
    ///
    /// - Parameter notification: нотификация
    func changeTheme(notification: Notification) {
        
        guard let colorDict = notification.userInfo as? [String : Bool] else { return }
        
        if colorDict[switchDict] == true {
         
            view.backgroundColor = UIColor.darkGray
            nameLabel.textColor = UIColor.white
            surnameLabel.textColor = UIColor.white
            yearOldLabel.textColor = UIColor.white
            emailLabel.textColor = UIColor.white
            loginLabel.textColor = UIColor.white
        } else {
            
            view.backgroundColor = UIColor.white
            nameLabel.textColor = UIColor.black
            surnameLabel.textColor = UIColor.black
            yearOldLabel.textColor = UIColor.black
            emailLabel.textColor = UIColor.black
            loginLabel.textColor = UIColor.black
        }
    }
    
    /// Инициализация данных
    func initData() {
        
        nameLabel.text = userModel.name
        surnameLabel.text = userModel.surname
        yearOldLabel.text = String(NSCalendar.current.component(.year, from: NSDate() as Date) - userModel.yearOfBirth)
        emailLabel.text = userModel.email
        loginLabel.text = userModel.login
    }
    
    /// Кнопка для того, чтобы вернуться назад
    ///
    /// - Parameter sender: Кнопка cancelButton
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
