//
//  Preferences.swift
//  Events
//
//  Created by Michael Zhukov on 12/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import Foundation

class Preferences {
    private let defaults: UserDefaults

    init() {
        self.defaults = UserDefaults.standard
    }

    var eventsCategories: EventsCategories {
        get {
            return getObject(forKey: "events_categories", type: EventsCategories.self) ?? EventsCategories()
        }
        set(categories) {
            saveObject(forKey: "events_categories", object: categories)
        }
    }

    private func getObject<T: Decodable>(forKey: String, type: T.Type) -> T? {
        if let data = defaults.value(forKey: forKey) as? Data {
            return try! PropertyListDecoder().decode(type.self, from: data)
        }
        return nil
    }

    private func saveObject<T: Codable>(forKey: String, object: T) {
        defaults.set(try? PropertyListEncoder().encode(object), forKey: forKey)
    }
}
