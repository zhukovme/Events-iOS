//
//  ParamsBuilderTest.swift
//  EventsTests
//
//  Created by Michael Zhukov on 19/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import XCTest
@testable import Events
import InstantMock

class ParamsBuilderTest: XCTestCase {
    var paramsBuilder: ParamsBuilder!

    override func setUp() {
        super.setUp()
        paramsBuilder = ParamsBuilder()
    }

    func testWithoutParamsForEvents() {
        let actual = paramsBuilder.forEvents()
        XCTAssertEqual([:], actual as! [String: String])
    }

    func testCategoriesForEvents() {
        let tttt = EventsCategories(conferences: true, exhibitions: true, festivals: true, awards: true)
        categoriesForEventsHelper(categories: tttt, expected: ["category": "1-2-24-19"])
        let ffff = EventsCategories(conferences: false, exhibitions: false, festivals: false, awards: false)
        categoriesForEventsHelper(categories: ffff, expected: ["category": ""])
        let tftf = EventsCategories(conferences: true, exhibitions: false, festivals: true, awards: false)
        categoriesForEventsHelper(categories: tftf, expected: ["category": "1-24"])
        let ftft = EventsCategories(conferences: false, exhibitions: true, festivals: false, awards: true)
        categoriesForEventsHelper(categories: ftft, expected: ["category": "2-19"])
        let tfff = EventsCategories(conferences: true, exhibitions: false, festivals: false, awards: false)
        categoriesForEventsHelper(categories: tfff, expected: ["category": "1"])
        let ftff = EventsCategories(conferences: false, exhibitions: true, festivals: false, awards: false)
        categoriesForEventsHelper(categories: ftff, expected: ["category": "2"])
        let fftf = EventsCategories(conferences: false, exhibitions: false, festivals: true, awards: false)
        categoriesForEventsHelper(categories: fftf, expected: ["category": "24"])
        let ffft = EventsCategories(conferences: false, exhibitions: false, festivals: false, awards: true)
        categoriesForEventsHelper(categories: ffft, expected: ["category": "19"])
    }

    func testEventIdForEventInfo() {
        let eventId = "11232"
        let expected = ["id": eventId]

        let actual = paramsBuilder.forEventInfo(eventId: eventId)

        XCTAssertEqual(expected, actual as! [String: String])
    }

    private func categoriesForEventsHelper(categories: EventsCategories, expected: [String: String]) {
        let actual = paramsBuilder.forEvents(categories: categories)
        XCTAssertEqual(expected, actual as! [String: String])
    }
}
