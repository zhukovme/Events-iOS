//
//  CategoryFilterModule.swift
//  Events
//
//  Created by Michael Zhukov on 12/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import DITranquillity

class CategoryFilterModule: DIPart {
    static func load(container: DIContainer) {
        container.register1(CategoryFilterPresenter.init)
        container.register(CategoryFilterViewController.self)
            .injection { $0.presenter = $1 }
    }
}
