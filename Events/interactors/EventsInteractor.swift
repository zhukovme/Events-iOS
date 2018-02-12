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

    init(api: Api, preferences: Preferences) {
        self.api = api
        self.preferences = preferences
    }

    var categories: EventsCategories {
        get {
            return preferences.eventsCategories
        }
        set(categories) {
            preferences.eventsCategories = categories
        }
    }

    func getEvents() -> Observable<[Event]> {
        let categories = setupCategories()
        return api.events(params: [
//                "day" : "",
//                "month" : "",
//                "year" : "",
//                "limit" : "",
                "category" : categories
//                "lang" : ""
            ])
            .map { response in
                return response.resource ?? [Event]()
            }
    }

    private func setupCategories() -> String {
        var categories = [String]()
        if self.categories.conferences {
            categories.append("1")
        }
        if self.categories.exhibitions {
            categories.append("2")
        }
        if self.categories.festivals {
            categories.append("24")
        }
        if self.categories.awards {
            categories.append("19")
        }
        return categories.joined(separator: "-")
    }
}
