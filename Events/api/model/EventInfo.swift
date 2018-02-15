//
//  EventInfo.swift
//  Events
//
//  Created by Michael Zhukov on 14/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import ObjectMapper

class EventInfo: Mappable {
    var id: String?
    var title: String?
    var descriptionShort: String?
    var description: String?
    var imageUrl: String?
    var videoUrl: String?
    var date: String?
    var startDate: CLong?
    var endDate: CLong?
    var time: String?
    var category: String?
    var location: String?
    var regUrl: String?
    var url: String?
    var email: String?
    var facebook: String?
    var vk: String?
    var twitter: String?
    var pinterest: String?
    var linkedin: String?
    var odnoklasniki: String?
    var googleplus: String?
    var instagram: String?
    var tumblr: String?
    var youtube: String?
    var latitude: Float?
    var longitude: Float?
    var zoom: String?
    var hasReg: Bool?
    var hasParty: Bool?
    var hasMaps: Bool?
    var hasSponsors: Bool?
    var hasPartner: Bool?
    var hasPress: Bool?
    var hasTimeTable: Bool?
    var hasSpeakers: Bool?
    var hasProducts: Bool?
    var hasIndustryNews: Bool?

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        descriptionShort <- map["small"]
        description <- map["full"]
        imageUrl <- map["imgurl"]
        videoUrl <- map["videourl"]
        date <- map["date"]
        startDate <- map["startdate"]
        endDate <- map["enddate"]
        time <- map["time"]
        category <- map["category"]
        location <- map["location"]
        regUrl <- map["regurl"]
        url <- map["url"]
        email <- map["email"]
        facebook <- map["facebook"]
        vk <- map["vk"]
        twitter <- map["twitter"]
        pinterest <- map["pinterest"]
        linkedin <- map["linkedin"]
        odnoklasniki <- map["odnoklasniki"]
        googleplus <- map["googleplus"]
        instagram <- map["instagram"]
        tumblr <- map["tumblr"]
        youtube <- map["youtube"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        zoom <- map["zoom"]
        hasReg <- map["hasReg"]
        hasParty <- map["hasParty"]
        hasMaps <- map["hasMaps"]
        hasSponsors <- map["hasSponsors"]
        hasPartner <- map["hasPartner"]
        hasPress <- map["hasPress"]
        hasTimeTable <- map["hasTimeTable"]
        hasSpeakers <- map["hasSpeakers"]
        hasProducts <- map["hasProducts"]
        hasIndustryNews <- map["hasIndustryNews"]
    }
}
