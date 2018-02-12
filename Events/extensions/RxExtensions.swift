//
//  RxExtensions.swift
//  Events
//
//  Created by Michael Zhukov on 03/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import RxSwift

extension ObservableType {
    public func applySchedulers() -> Observable<Self.E> {
        return subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
    }
}
