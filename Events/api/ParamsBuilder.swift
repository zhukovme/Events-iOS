//
//  ParamsBuilder.swift
//  Events
//
//  Created by Michael Zhukov on 19/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

class ParamsBuilder {
    func forEvents(categories: EventsCategories? = nil) -> [String: Any] {
        var params: [String: Any] = [:]
        if categories != nil {
            params["category"] = setupCategories(categories!)
        }
        // TODO: Setup date, limit, lang
        return params
    }

    func forEventInfo(eventId: String) -> [String: Any] {
        var params: [String: Any] = [:]
        params["id"] = eventId
        // TODO: Setup lang
        return params
    }

    private func setupCategories(_ categories: EventsCategories) -> String {
        var result = [String]()
        if categories.conferences {
            result.append("1")
        }
        if categories.exhibitions {
            result.append("2")
        }
        if categories.festivals {
            result.append("24")
        }
        if categories.awards {
            result.append("19")
        }
        return result.joined(separator: "-")
    }
}
