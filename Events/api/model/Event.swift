//
//  Event.swift
//  Events
//
//  Created by Michael Zhukov on 03/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import ObjectMapper

class EventItem: Mappable {
    var id: String?
    var title: String?
    var date: String?
    var location: String?
    var category: String?
    var time: String?
    var imageUrl: String?

    required init?(map: Map) {
    }

    init(id: String?, title: String?, date: String?, location: String?, category: String?, time: String?,
         imageUrl: String?) {
        self.id = id
        self.title = title
        self.date = date
        self.location = location
        self.category = category
        self.time = time
        self.imageUrl = imageUrl
    }

    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        date <- map["date"]
        location <- map["location"]
        category <- map["category"]
        time <- map["time"]
        imageUrl <- map["imgurl"]
    }
}
