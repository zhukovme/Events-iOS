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
        container.register { Api() }
        // Database
        container.register { Preferences() }

        // Interactors
        container.register { EventsInteractor(api: $0, preferences: $1) }

        // View
        container.register { MessagesView() }
        container.append(part: EventListModule.self)
        container.append(part: CategoryFilterModule.self)
    }
}
