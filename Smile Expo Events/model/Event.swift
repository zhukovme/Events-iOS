//
//  Event.swift
//  Smile Expo Events
//
//  Created by Michael Zhukov on 03/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import ObjectMapper

class Event: Mappable {

    var id: String?
    var title: String?
    var date: String?
    var location: String?
    var category: String?
    var time: String?
    var imageUrl: String?

    required init?(map: Map) {
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
