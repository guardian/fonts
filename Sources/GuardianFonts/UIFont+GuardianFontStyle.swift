//
#if os(iOS)
import UIKit

public extension UIFont {
    @objc
    convenience init(style: GuardianFontStyle, size: CGFloat) {
        self.init(style: style, size: size, useLiningNumbers: false)
    }

    @objc
    convenience init(style: GuardianFontStyle, size: CGFloat, useLiningNumbers: Bool) {
        if useLiningNumbers {
            let feature: [UIFontDescriptor.FeatureKey: Int] = [.typeIdentifier: kUpperCaseNumbersSelector, .featureIdentifier: kNumberCaseType]
            let descriptor = UIFontDescriptor(fontAttributes: [.name: style.fontName, .featureSettings: [feature]])
            self.init(descriptor: descriptor, size: size)
        } else {
            self.init(name: style.fontName, size: size)!
        }
    }

    @objc
    static func fontName(for style: GuardianFontStyle) -> String {
        style.fontName
    }
}

#endif
