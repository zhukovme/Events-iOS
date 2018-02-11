//
//  Response.swift
//  Smile Expo Events
//
//  Created by Michael Zhukov on 03/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import ObjectMapper

class Response<T: Mappable>: Mappable {
    var status: String?
    var resource: [T]?

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        status <- map["status"]
        resource <- map["resource"]
    }
}
