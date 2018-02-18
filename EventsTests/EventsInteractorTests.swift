//
//  EventsTests.swift
//  EventsTests
//
//  Created by Michael Zhukov on 03/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import XCTest
@testable import Events
import InstantMock
import RxSwift
import RxTest

class EventsInteractorTests: XCTestCase {
    var api: ApiMock!
    var preferences: PreferencesMock!
    var paramsBuilder: ParamsBuilderMock!

    var eventsInteractor: EventsInteractor!

    let scheduler = TestScheduler(initialClock: 0)

    override func setUp() {
        super.setUp()
        api = ApiMock()
        preferences = PreferencesMock()
        paramsBuilder = ParamsBuilderMock()
        eventsInteractor = EventsInteractor(api: api, preferences: preferences, paramsBuilder: paramsBuilder)
    }

    func testShouldSaveCategories() {
        let expected = EventsCategories(conferences: false, exhibitions: true, festivals: false, awards: false)

        eventsInteractor.categories = expected

        XCTAssertEqual(expected, preferences.eventsCategories)
    }

    func testShouldGetStoredCategories() {
        let expected = EventsCategories(conferences: false, exhibitions: true, festivals: false, awards: false)
        preferences.eventsCategories = expected

        let actual = eventsInteractor.categories

        XCTAssertEqual(expected, actual)
    }

    func testShouldCallGetEventsApi() {
        api.it.expect().call(api.events(params: Arg.any()))

        let _ = eventsInteractor.getEvents()
            .subscribe(scheduler.createObserver([EventItem].self))
        scheduler.start()

        api.it.verify()
    }

    func testShouldCallGetEventInfoApi() {
        let eventId = "32313"
        let params = ["id": "32313"]
        paramsBuilder.it.stub()
            .call(paramsBuilder.forEventInfo(eventId: Arg.eq(eventId)))
            .andReturn(Arg.eq(params))
        api.it.expect().call(api.eventInfo(params: Arg.eq(params)))

        let _ = eventsInteractor.getEventInfo(eventId: eventId)
            .subscribe(scheduler.createObserver(EventInfo?.self))
        scheduler.start()

        api.it.verify()
    }

    private func genEvents(category: String, count: Int) -> [EventItem] {
        var events = [EventItem]()
        for i in 1...count {
            events.append(EventItem(id: "\(i)", title: "title \(i)", date: "date \(i)", location: "location \(i)",
                category: category, time: "time \(i)", imageUrl: "imageUrl \(i)"))
        }
        return events
    }
}
