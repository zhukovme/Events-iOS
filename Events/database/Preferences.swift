//
//  Preferences.swift
//  Events
//
//  Created by Michael Zhukov on 12/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import Foundation

class Preferences {
    private let defaults = UserDefaults.standard

    var eventsCategories: EventsCategories {
        get {
            if let data = UserDefaults.standard.value(forKey:"events_categories") as? Data {
                return try! PropertyListDecoder().decode(EventsCategories.self, from: data)
            }
            return EventsCategories()
        }
        set(categories) {
            defaults.set(try? PropertyListEncoder().encode(categories), forKey: "events_categories")
        }
    }

    private func retrieveObject(key: String) -> Any? {
        if let data = defaults.object(forKey: key) as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: data)
        } else {
            return nil
        }
    }
}
