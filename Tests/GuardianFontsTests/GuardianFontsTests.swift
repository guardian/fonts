import XCTest
@testable import GuardianFonts
final class GuardianFontsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        GuardianFonts.registerFonts()
    }


    func testFonts() {
        XCTAssert(GuardianFonts.hasRegistered == true, "We should have registered our fonts before we start")

        for font in GuardianFontStyle.allCases {
            XCTAssertNotNil(UIFont(name: font.fontName, size: 20), "\(font.fontName) was not found")
        }
    }
}
