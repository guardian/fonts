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

#if os(iOS)
    public var uiFont: UIFont {
        UIFont(name: style.fontName, size: size) ?? .systemFont(ofSize: size)
    }
    #else
    public var nsFont: NSFont {
        NSFont(name: style.fontName, size: size) ?? .systemFont(ofSize: size)
    }
    #endif

    public init(style: GuardianFontStyle, size: CGFloat, lineHeight: CGFloat? = nil) {
        self.style = style
        self.size = size
        self.lineHeight = lineHeight
    }
}
