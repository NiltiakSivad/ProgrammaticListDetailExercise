import XCTest
@testable import ProgrammaticListDetailExercise

class OfferListViewModelTests: XCTestCase {

    let offersData = [Offer(identifier: "efgh2",
                            url: "https://www.example4444.com",
                            name: "Dove Chocolate",
                            description: "Any variety - Any size",
                            terms: "Rebate valid on Dove chocolates for any variety, any size",
                            currentValue: "$0.50 Cash Back"),
                      Offer(identifier: "abcd1",
                            url: "https://www.example3333.com",
                            name: "Crest Toothpaste",
                            description: "Any variety - Any size",
                            terms: "Rebate valid on Crest® Toothpaste for any variety, any size",
                            currentValue: "$1.00 Cash Back")]

    var subject: OfferListViewModel?

    override func setUp() {
        subject = OfferListViewModel(offers: offersData)
    }

    func testOffersDataToOfferListViewModelCreation() {
        XCTAssertEqual(subject?.offers.count, 2)
    }

    func testOffersAreSortedByName() {
        subject?.offers.enumerated().forEach { (index, offer) in
            guard let name1 = offer.name, let name2 = subject?.getOffer(at: index + 1)?.name else {
                return
            }
            let result = name1 < name2
            XCTAssertTrue(result)
        }
    }

    func testGetOfferRetrievesOffer() {
        XCTAssertTrue(subject?.getOffer(at: 0) == subject?.offers[0])

        XCTAssertTrue(subject?.getOffer(at: 3) == nil)
    }
}
