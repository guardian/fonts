import Foundation
import SwiftUI

/// This type encaspulates the GuardianFontStyle, size and line height to be applied.
public struct GuardianFont {
    public let style: GuardianFontStyle
    public let size: CGFloat
    public let lineHeight: CGFloat?

    public var font: Font {
        Font.custom(style.fontName, size: size)
    }

    public var uiFont: UIFont {
        UIFont(name: style.fontName, size: size) ?? .systemFont(ofSize: size)
    }

    public init(style: GuardianFontStyle, size: CGFloat, lineHeight: CGFloat? = nil) {
        self.style = style
        self.size = size
        self.lineHeight = lineHeight
    }
}
