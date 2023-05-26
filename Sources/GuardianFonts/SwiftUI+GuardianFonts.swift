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

        self.font = UIFont(name: fontName, size: fontSize)
    }

    let fontName: String
    let fontSize: CGFloat
    let lineHeight: CGFloat?
    let relativeStyle: Font.TextStyle

    let verticalTrim: VerticalTrim

    let font: UIFont?

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
        return lineHeight / font.lineHeight
    }

    public func body(content: Content) -> some View {
        content
            .font(Font.custom(fontName, size: fontSize, relativeTo: relativeStyle))
            ._lineHeightMultiple(lineMultiple)
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
    func font(
        _ style: GuardianFontStyle,
        size: CGFloat,
        lineHeight: CGFloat? = nil,
        verticalTrim: VerticalTrim = .capToBaseline
    ) -> some View {
        modifier(
            FontPad(
                fontName: style.fontName,
                fontSize: size,
                lineHeight: lineHeight,
                relativeStyle: style.relativeStyle,
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
    @available(*, deprecated, message: "This method is no longer supported. Use `View.font(:size:lineHeight:verticalTrim:)` instead")
    static func custom(style: GuardianFontStyle, size: CGFloat) -> Font {
        Font.custom(style.fontName, size: size)
    }

    @available(*, deprecated, message: "This method is no longer supported. Use `View.font(:size:lineHeight:verticalTrim:)` instead")
    static func custom(style: GuardianFontStyle, size: CGFloat, relativeTo fontStyle: Font.TextStyle) -> Font {
        Font.custom(style.fontName, size: size, relativeTo: fontStyle)
    }
}
