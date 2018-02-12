//
//  Extensions.swift
//  Events
//
//  Created by Michael Zhukov on 03/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import RxSwift
import ObjectMapper
import Alamofire

extension ObservableType {
    public func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return flatMap { data -> Observable<T> in
            let (_, json) = data as! (HTTPURLResponse, Any)
            guard let object = Mapper<T>().map(JSONObject: json) else {
                throw Errors.mappingError
            }
            return Observable.just(object)
        }
    }

    public func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return flatMap { data -> Observable<[T]> in
            let (_, json) = data as! (HTTPURLResponse, Any)
            guard let objects = Mapper<T>().mapArray(JSONObject: json) else {
                throw Errors.mappingError
            }
            return Observable.just(objects)
        }
    }
}

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
            Logger.log(self)
        #endif
        return self
    }
}
