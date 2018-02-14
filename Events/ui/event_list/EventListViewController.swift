//
//  EventListTableViewController.swift
//  Events
//
//  Created by Michael Zhukov on 03/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import UIKit

final class EventListViewController: ViewController<EventListPresenter>, UITableViewDelegate, EventListMvpView {
    // MARK: Views

    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()

    var messages: MessagesView?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.view.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = presenter
        setupRefreshControl()
        presenter?.viewDidLoad(view: self)
    }

    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let destination = segue.destination as? EventInfoViewController else {
            Logger.log("Unexpected destination: \(segue.destination)")
            return
        }
        guard let selectedCell = sender as? EventListCell else {
            Logger.log("Unexpected sender: \(sender ?? "")")
            return
        }
        guard let indexPath = tableView.indexPath(for: selectedCell) else {
            Logger.log("The selected cell is not being displayed by the table")
            return
        }
        let selectedMeal = presenter?.getEvent(row: indexPath.row)
        destination.eventId = selectedMeal?.id
    }

    // MARK: Actions

    @objc private func onRefresh(_ sender: Any) {
        presenter?.onRefresh()
    }

    @IBAction func unwindToEventList(segue: UIStoryboardSegue) {
        if let _ = segue.source as? CategoryFilterViewController {
            presenter?.onRefresh()
        }
    }

    // MARK: MVP protocol methods

    func showRefreshing() {
        if !refreshControl.isRefreshing {
            refreshControl.beginRefreshingWithAnimation()
        }
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

    //MARK: Private methods

    private func setupRefreshControl() {
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(onRefresh(_:)), for: .valueChanged)
    }
}
