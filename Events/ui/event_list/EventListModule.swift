//
//  EventListModule.swift
//  Events
//
//  Created by Michael Zhukov on 05/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import DITranquillity

class EventListModule: DIPart {
    static func load(container: DIContainer) {
        container.register1(EventListPresenter.init)
        container.register(EventListViewController.self)
            .injection { $0.presenter = $1 }
    }
}
