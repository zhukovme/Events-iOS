//
//  EventListTableViewController.swift
//  Events
//
//  Created by Michael Zhukov on 03/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import UIKit

final class EventListViewController: ViewController<EventListPresenter>, UITableViewDelegate, EventListMvpView {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = presenter
        presenter?.viewDidLoad(view: self)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.onCellClick(row: indexPath.row)
    }

    func reloadTable() {
        tableView.reloadData()
    }

    func showError(message: String) {
//        Show error
    }
}
