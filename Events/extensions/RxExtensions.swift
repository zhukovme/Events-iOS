//
//  RxExtensions.swift
//  Events
//
//  Created by Michael Zhukov on 03/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import RxSwift

extension ObservableType {
    public func applyMainSchedulers<E>() -> Observable<E> {
        return observeOn(MainScheduler.instance) as! Observable<E>
    }
}
