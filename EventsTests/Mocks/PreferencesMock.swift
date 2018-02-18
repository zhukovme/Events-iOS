//
//  PreferencesMock.swift
//  EventsTests
//
//  Created by Michael Zhukov on 18/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

@testable import Events
import InstantMock

class PreferencesMock: Preferences, MockDelegate {
    private let mock = Mock()

    var it: Mock {
        return mock
    }

    override var eventsCategories: EventsCategories {
        get {
            return super.eventsCategories
        }
        set {
            super.eventsCategories = newValue
        }
    }
}
