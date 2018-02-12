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

    @objc private func onRefresh(_ sender: Any) {
        presenter?.onRefresh()
    }

    var messages: MessagesView?
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = presenter
        setupRefreshControl()
        presenter?.viewDidLoad(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.onCellClick(row: indexPath.row)
    }

    func showRefreshing() {
        refreshControl.beginRefreshing()
    }

    func hideRefreshing() {
        refreshControl.endRefreshing()
    }

    func reloadTable() {
        tableView.reloadData()
    }

    func showMessage(type: MessageType, message: String) {
        messages?.show(type: type, body: message)
    }

    private func setupRefreshControl() {
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(onRefresh(_:)), for: .valueChanged)
    }
}
