import Foundation
#if os(iOS)
import UIKit
#else
import AppKit
#endif

/// An enumeration representing the various font styles used in the Guardian's digital platforms.
/// Each case corresponds to a specific font style.
///
/// - Note: The font files and the CDN URLs at which they are hosted may only be used for Guardian websites or apps.
/// All fonts are the property of Schwartzco, Inc., t/a Commercial Type (https://commercialtype.com/), and may not be reproduced without permission.
@objc public enum GuardianFontStyle: Int, CaseIterable {
    /// Titlepiece font style in bold.
    case titlepieceBold

    /// Headline font styles.
    case headlineLight
    case headlineLightItalic
    case headlineRegular
    case headlineRegularItalic
    case headlineMedium
    case headlineMediumItalic
    case headlineSemibold
    case headlineSemiboldItalic
    case headlineBold
    case headlineBoldItalic
    case headlineBlack
    case headlineBlackItalic

    /// Text Egyptian font styles.
    case textEgyptianRegular
    case textEgyptianRegularItalic
    case textEgyptianMedium
    case textEgyptianMediumItalic
    case textEgyptianBold
    case textEgyptianBoldItalic
    case textEgyptianBlack
    case textEgyptianBlackItalic

    /// Text Sans font styles.
    case textSansRegular
    case textSansRegularItalic
    case textSansMedium
    case textSansMediumItalic
    case textSansBold
    case textSansBoldItalic
    case textSansBlack
    case textSansBlackItalic

    /// The name of the font associated with the style.
    public var fontName: String {
        GuardianFonts.fontName(for: self)
    }
}

@objc
public class GuardianFonts: NSObject {

    override public init() {}

    internal static var hasRegistered = false

    @objc
    public static func registerFonts() {
        if !hasRegistered {
            GuardianFontStyle.allCases.forEach {
                registerFont(bundle: Bundle.module, fileName: $0.fontName, fontExtension: "ttf")
            }
            hasRegistered = true
        }
    }

    /// Mapping from GuardianFontStyle to the font name
    fileprivate static func fontName(for style: GuardianFontStyle) -> String {
        switch style {
        case .headlineBold:
            return "GHGuardianHeadline-Bold"
        case .headlineRegularItalic:
            return "GHGuardianHeadline-RegularItalic"
        case .headlineLight:
            return "GHGuardianHeadline-Light"
        case .headlineMedium:
            return "GHGuardianHeadline-Medium"
        case .headlineRegular:
            return "GHGuardianHeadline-Regular"
        case .headlineSemibold:
            return "GHGuardianHeadline-Semibold"
        case .headlineLightItalic:
            return "GHGuardianHeadline-LightItalic"
        case .headlineMediumItalic:
            return "GHGuardianHeadline-MediumItalic"
        case .headlineSemiboldItalic:
            return "GHGuardianHeadline-SemiboldItalic"
        case .headlineBoldItalic:
            return "GHGuardianHeadline-BoldItalic"
        case .headlineBlack:
            return "GHGuardianHeadline-Black"
        case .headlineBlackItalic:
            return "GHGuardianHeadline-BlackItalic"
        case .textSansBold:
            return "GuardianTextSans-Bold"
        case .textSansBoldItalic:
            return "GuardianTextSans-BoldIt"
        case .textSansRegular:
            return "GuardianTextSans-Regular"
        case .textSansRegularItalic:
            return "GuardianTextSans-RegularIt"
        case .textSansMedium:
            return "GuardianTextSans-Medium"
        case .textSansMediumItalic:
            return "GuardianTextSans-MediumIt"
        case .textSansBlack:
            return "GuardianTextSans-Black"
        case .textSansBlackItalic:
            return "GuardianTextSans-BlackIt"
        case .textEgyptianRegular:
            return "GuardianTextEgyptian-Reg"
        case .textEgyptianRegularItalic:
            return "GuardianTextEgyptian-RegIt"
        case .textEgyptianMedium:
            return "GuardianTextEgyptian-Med"
        case .textEgyptianMediumItalic:
            return "GuardianTextEgyptian-MedIt"
        case .textEgyptianBold:
            return "GuardianTextEgyptian-Bold"
        case .textEgyptianBoldItalic:
            return "GuardianTextEgyptian-BoldIt"
        case .textEgyptianBlack:
            return "GuardianTextEgyptian-Black"
        case .textEgyptianBlackItalic:
            return "GuardianTextEgyptian-BlackIt"
        case .titlepieceBold:
            return "GTGuardianTitlepiece-Bold"
        }
    }

    /// Register font file with the application
    /// - Parameters:
    ///   - bundle: Bundle containing the font file asset
    ///   - fileName: Name of the font file
    ///   - fontExtension: font file extension, eg. ttf
    fileprivate static func registerFont(bundle: Bundle, fileName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fileName, withExtension: fontExtension),
            let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
            let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from filename: \(fileName) with extension \(fontExtension)")
        }
        var error: Unmanaged<CFError>?
        // Register font with the Core Graphics Font Manager
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
