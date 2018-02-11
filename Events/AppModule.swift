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
        container.register { Api() }
        container.append(part: EventListModule.self)
    }
}
