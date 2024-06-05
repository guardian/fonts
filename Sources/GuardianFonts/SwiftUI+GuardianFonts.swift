//

import SwiftUI

public enum VerticalTrim {
    case standard
    case capToBaseline
}

public struct FontPad: ViewModifier {
    internal init(fontName: String, fontSize: CGFloat, lineHeight: CGFloat? = nil, relativeStyle: Font.TextStyle, verticalTrim: VerticalTrim) {
        self.fontName = fontName
        self.fontSize = fontSize
        self.lineHeight = lineHeight
        self.relativeStyle = relativeStyle
        self.verticalTrim = verticalTrim

#if os(iOS)
        self.font = UIFont(name: fontName, size: fontSize)
#else
        self.font = NSFont(name: fontName, size: fontSize)
#endif
    }

    let fontName: String
    let fontSize: CGFloat
    let lineHeight: CGFloat?
    let relativeStyle: Font.TextStyle

    let verticalTrim: VerticalTrim

    #if os(iOS)
    let font: UIFont?
    #else
    let font: NSFont?
    #endif

    private var topValue: CGFloat {
        guard verticalTrim == .capToBaseline else { return 0 }
        guard let font else { return 0 }
        return -(font.ascender - font.capHeight)
    }
    private var bottomValue: CGFloat {
        guard verticalTrim == .capToBaseline else { return 0 }
        guard let font else { return 0 }
        return font.descender
    }
    private var lineMultiple: CGFloat {
        guard let lineHeight else { return 1 }
        guard let font else { return 1 }
#if os(iOS)
        let fontsLineHeight = font.lineHeight
#else
        let fontsLineHeight = font.xHeight
#endif
        return lineHeight / fontsLineHeight
    }

    private var lineSpacing: CGFloat {
        guard let lineHeight else { return 0 }
        guard let font else { return 0 }
        let fontsLineHeight = font.lineHeight
        return lineHeight - fontsLineHeight
    }

    public func body(content: Content) -> some View {
        content
            .font(Font.custom(fontName, size: fontSize, relativeTo: relativeStyle))
            .lineSpacing(lineSpacing)
            .multilineTextAlignment(.leading)
            .padding(
                .top,
                topValue
            )
            .padding(
                .bottom,
                bottomValue
            )
    }
}

public extension View {
    /// Use this function on a view to apply a Guardian Font Style.
    /// This is preferred and more in line with SwiftUI best practices.
    ///
    /// For example: `.font(.textSansRegular, size: 14)`
    /// Here `.textSansRegular` is a GuardianFontStyle.
    ///
    /// To have a fixedSize, add `.dynamicTypeSize(.large)` line after this function
    ///
    /// - Parameters:
    ///   - style: GuardianFontStyle to be applied to the text
    ///   - size: Intended size of the text
    ///   - lineHeight: Custom line height. Nil by default
    ///   - verticalTrim: Custom vertical trim for the font. `.capToBaseline` by default. Can be set to `.standard` to have some vertical padding.
    ///   - relativeStyle: Relative dynamic scale type. This is nil be default in which case, the relative style is defined by the `style` parameter.
    /// - Returns: Modified view with the Guardian Font applied
    func font(
        _ style: GuardianFontStyle,
        size: CGFloat,
        lineHeight: CGFloat? = nil,
        verticalTrim: VerticalTrim = .capToBaseline,
        relativeStyle: Font.TextStyle? = nil
    ) -> some View {
        modifier(
            FontPad(
                fontName: style.fontName,
                fontSize: size,
                lineHeight: lineHeight,
                relativeStyle: relativeStyle ?? style.relativeStyle,
                verticalTrim: verticalTrim
            )
        )
    }

    /// Use this function on a view to apply a GuardianFont.
    /// This can be used if you're defnining GuardianFont to be applied somewhere separately.
    ///
    /// For example: `.font(.guardianSubtitle, verticalTrim: .standard)`
    /// Here `.guardianSubtitle` is a GuardianFont.
    ///
    /// To have a fixedSize, add `.dynamicTypeSize(.large)` line after this function
    ///
    /// - Parameters:
    ///   - font: GuardianFont encapsulating the GuardianFontStyle, size and line height to be applied.
    ///   - verticalTrim: Custom vertical trim for the font. `.capToBaseline` by default. Can be set to `.standard` to have some vertical padding.
    ///   - relativeStyle: Relative dynamic scale type. This is nil be default in which case, the relative style is defined by the `style` parameter.
    /// - Returns: Modified view with the Guardian Font applied
    func font(
        _ font: GuardianFont,
        verticalTrim: VerticalTrim = .capToBaseline,
        relativeStyle: Font.TextStyle? = nil
    ) -> some View {
        modifier(
            FontPad(
                fontName: font.style.fontName,
                fontSize: font.size,
                lineHeight: font.lineHeight,
                relativeStyle: relativeStyle ?? font.style.relativeStyle,
                verticalTrim: verticalTrim
            )
        )
    }
}

public extension View {
    func previewFonts() -> some View {
        onAppear {
            GuardianFonts.registerFonts()
        }
    }
}

public extension GuardianFontStyle {
    var relativeStyle: Font.TextStyle {
        switch self {
        case .headlineLight, .headlineRegular, .headlineMedium, .headlineBold, .headlineSemibold, .headlineRegularItalic, .headlineLightItalic, .headlineMediumItalic, .headlineSemiboldItalic, .headlineBoldItalic, .headlineBlack, .headlineBlackItalic:
            return .headline
        case .textSansBold, .textSansBoldItalic, .textSansRegular, .textSansRegularItalic, .textSansMedium, .textSansMediumItalic, .textSansBlack, .textSansBlackItalic:
            return .body
        case .textEgyptianRegular, .textEgyptianRegularItalic, .textEgyptianMedium, .textEgyptianMediumItalic, .textEgyptianBold, .textEgyptianBoldItalic, .textEgyptianBlack, .textEgyptianBlackItalic:
            return .body
        case .titlepieceBold:
            return .title
        }
    }
}
public extension Font {
    @available(iOS, deprecated: 100000.0, message: "This method is no longer supported. Use `View.font(:size:lineHeight:verticalTrim:)` instead")
    static func custom(style: GuardianFontStyle, size: CGFloat) -> Font {
        Font.custom(style.fontName, size: size)
    }

    @available(iOS, deprecated: 100000.0, message: "This method is no longer supported. Use `View.font(:size:lineHeight:verticalTrim:)` instead")
    static func custom(style: GuardianFontStyle, size: CGFloat, relativeTo fontStyle: Font.TextStyle) -> Font {
        Font.custom(style.fontName, size: size, relativeTo: fontStyle)
    }
}
