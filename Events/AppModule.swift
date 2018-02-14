//
//  AppAssembly.swift
//  Events
//
//  Created by Michael Zhukov on 05/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import DITranquillity

class AppModule: DIFramework {
    static func load(container: DIContainer) {
        // Service
        container.register(Api.init)
            .lifetime(.single)
        // Database
        container.register(Preferences.init)
            .lifetime(.single)

        // Interactors
        container.register(EventsInteractor.init)
            .lifetime(.single)

        // View
        container.register(MessagesView.init)
            .lifetime(.single)
        container.append(part: EventListModule.self)
        container.append(part: CategoryFilterModule.self)
        container.append(part: EventInfoModule.self)
    }
}
