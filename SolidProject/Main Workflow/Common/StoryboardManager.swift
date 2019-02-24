import Foundation
import UIKit

class StoryboardManager {
    
    static func getViewController(_ identifier: String, from storyboard: String) -> UIViewController? {
         return UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: identifier) as UIViewController
    }
}
