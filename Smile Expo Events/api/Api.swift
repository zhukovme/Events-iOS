//
//  Api.swift
//  Smile Expo Events
//
//  Created by Michael Zhukov on 03/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import RxAlamofire
import RxSwift

class Api {

    private static let BASE_URL = "https://apia.exp0.in/api.php/smileExpo/"

    static func events(day: String?, month: String?, year: String?, limit: String?, category: String?,
                       lang: String?) -> Observable<Response<Event>> {
        return requestJSON(.get, BASE_URL + "eventsFeed")
                .mapObject(type: Response<Event>.self)
    }
}
