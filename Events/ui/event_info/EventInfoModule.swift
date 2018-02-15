//
//  EventInfoModule.swift
//  Events
//
//  Created by Michael Zhukov on 14/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import DITranquillity

class EventInfoModule: DIPart {
    static func load(container: DIContainer) {
        container.register1(EventInfoPresenter.init)
            .lifetime(.perContainer)
        container.register(EventInfoViewController.self)
            .injection { $0.presenter = $1 }
            .injection { $0.messagesView = $1 }
            .lifetime(.perContainer)
    }
}
