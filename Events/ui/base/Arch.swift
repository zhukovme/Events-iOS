//
//  Presenter.swift
//  Events
//
//  Created by Michael Zhukov on 11/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import UIKit

class Presenter: NSObject {
}

typealias ViewObject = Any

class ListCell: UITableViewCell {
    func configure(for viewModel: Any) {
    }
}

struct TableSection {
    let title: ViewObject?
    let items: [ViewObject]
}

class TablePresenter: Presenter, UITableViewDataSource {
    var sections = [TableSection]()
    var cellIdentifier: String?

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewObject = sections[indexPath.section].items[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier!) as? ListCell
            else { preconditionFailure() }
        cell.configure(for: viewObject)
        return cell
    }

    func setTableItems(_ items: [ViewObject]) {
        sections.insert(TableSection.init(title: nil, items: items), at: 0)
    }
}

class ViewController<T: Presenter>: UIViewController {
    var presenter: T?
}
