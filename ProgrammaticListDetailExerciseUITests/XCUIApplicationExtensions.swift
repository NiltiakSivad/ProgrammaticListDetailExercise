import XCTest

extension XCUIApplication {
    func cellWithText(containing labels: [String]) -> XCUIElementQuery {
        var cells = self.cells

        for label in labels {
            cells = cells.containing(NSPredicate(format: "label CONTAINS %@", label))
        }
        return cells
    }
}
