import Foundation
import UIKit

enum ColorTheme {
    case light
    case dark
}

enum Element {
    case text
    case background
}

extension UIColor {
    struct ThemeColors {
        static var white = UIColor.white
        static var black = UIColor.black
        
        static func getColor(element: Element, by theme: ColorTheme) -> UIColor {
            switch theme {
            case ColorTheme.light:
                switch element {
                case .text: return self.black
                case .background: return self.white
                }
            case ColorTheme.dark:
                switch element {
                case .text: return self.white
                case .background: return self.black
                }
            }
        }
    }
}

extension UIView {
    func setColors(by theme: ColorTheme) {
        tintColor = UIColor.ThemeColors.getColor(element: .text, by: theme)
        backgroundColor = UIColor.ThemeColors.getColor(element: .background, by: theme)
        
        subviews.forEach { (view) in
            view.setColors(by: theme)
        }
    }
}
