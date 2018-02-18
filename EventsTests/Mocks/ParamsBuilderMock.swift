//
//  ParamsBuilderMock.swift
//  EventsTests
//
//  Created by Michael Zhukov on 19/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

@testable import Events
import InstantMock

class ParamsBuilderMock: ParamsBuilder, MockDelegate {
    private let mock = Mock()

    var it: Mock {
        return mock
    }

    override func forEvents(categories: EventsCategories?) -> [String : Any] {
        return mock.call(categories)!
    }

    override func forEventInfo(eventId: String) -> [String : Any] {
        return mock.call(eventId)!
    }
}
