import Foundation
import UIKit

/// Меняет View Controller в заданной вкладке для TabBarController
class SwitchManager {
    
    /// Заменяет активный View Controlelr на заданный
    static func replaceVC(newVC: UIViewController, for tabBarController: UITabBarController) {
        tabBarController.viewControllers![tabBarController.selectedIndex] = newVC
    }
}

