import XCTest

class OfferListDetailUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments += ["UI-Testing"]
        app.launch()
    }

    // Demonstration purposes only - should not be running tests against main endpoint
    // Should consider using local server or mock server such as WireMock
    func testUserCanFavoriteAnOffer() {
        let cell = app.cellWithText(containing: ["Advil"])

        let favoriteImage = cell.images.containing(.image, identifier: "favoriteStatusImage").element
        XCTAssertFalse(favoriteImage.exists)

        cell.element.tap()

        let favoriteButton = app.buttons.containing(.button, identifier: "offerFavoriteButton")
        XCTAssertFalse(favoriteButton.element.isSelected)

        favoriteButton.element.tap()
        XCTAssertTrue(favoriteButton.element.isSelected)

        let backButton = app.navigationBars.buttons.element(boundBy: 0)
        backButton.tap()

        XCTAssertTrue(favoriteImage.exists)
    }
}
