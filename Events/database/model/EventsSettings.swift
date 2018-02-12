//
//  EventListRequest.swift
//  Events
//
//  Created by Michael Zhukov on 12/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

struct EventsCategories: Codable {
    let conferences, exhibitions, festivals, awards: Bool

    init(conferences: Bool, exhibitions: Bool, festivals: Bool, awards: Bool) {
        self.conferences = conferences
        self.exhibitions = exhibitions
        self.festivals = festivals
        self.awards = awards
    }

    init() {
        conferences = true
        exhibitions = true
        festivals = true
        awards = true
    }
}
