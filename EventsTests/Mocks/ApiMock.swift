//
//  ApiMock.swift
//  EventsTests
//
//  Created by Michael Zhukov on 18/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

@testable import Events
import InstantMock
import RxSwift

class ApiMock: Api, MockDelegate {
    private let mock = Mock()

    var it: Mock {
        return mock
    }

    override func events(params: [String: Any]?) -> Observable<ApiResponseArray<EventItem>> {
        return mock.call(params) ?? Observable.empty()
    }

    override func eventInfo(params: [String: Any]?) -> Observable<ApiResponse<EventInfo>> {
        return mock.call(params) ?? Observable.empty()
    }
}
