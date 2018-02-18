//
//  EventsInteractor.swift
//  Events
//
//  Created by Michael Zhukov on 12/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import RxSwift

class EventsInteractor {
    private let api: Api
    private let preferences: Preferences
    private let paramsBuilder: ParamsBuilder

    init(api: Api, preferences: Preferences, paramsBuilder: ParamsBuilder) {
        self.api = api
        self.preferences = preferences
        self.paramsBuilder = paramsBuilder
    }

    var categories: EventsCategories {
        get {
            return preferences.eventsCategories
        }
        set(categories) {
            preferences.eventsCategories = categories
        }
    }

    func getEvents() -> Observable<[EventItem]> {
        let params = paramsBuilder.forEvents(categories: categories)
        return api.events(params: params)
            .map { response in
                return response.resource ?? [EventItem]()
            }
    }

    func getEventInfo(eventId: String) -> Observable<EventInfo?> {
        let params = paramsBuilder.forEventInfo(eventId: eventId)
        return api.eventInfo(params: params)
            .map { response in
                return response.resource
            }
    }
}
