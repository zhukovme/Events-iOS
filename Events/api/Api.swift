//
//  Api.swift
//  Events
//
//  Created by Michael Zhukov on 03/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import RxAlamofire
import RxSwift

class Api {
    private let BASE_URL = "https://apia.exp0.in/api.php/smileExpo/"

    func events(params: [String: Any]?) -> Observable<Response<Event>> {
        return requestJSON(.get, BASE_URL + "eventsFeed", parameters: params)
                .mapObject(type: Response<Event>.self)
    }
}
