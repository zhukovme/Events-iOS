//
//  EventListTableViewController.swift
//  Smile Expo Events
//
//  Created by Michael Zhukov on 03/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import RxSwift

class EventListTableViewController: UITableViewController {

    var eventList: [Event] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadEventList()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventListCell",
                                                 for: indexPath) as! EventListCell
        let event = eventList[indexPath.row]
        cell.labelTitle.text = event.title ?? ""
        cell.ivImage.loadImage(url: event.imageUrl)
        showLocation(event, cell)
        showDate(event, cell)
        showTime(event, cell)
        return cell
    }

    private func showLocation(_ event: Event, _ cell: EventListCell) {
        let location = event.location?.fromHtml ?? ""
        cell.viewLocation.isHidden = location.isEmpty
        cell.labelLocation.text = location
    }

    private func showDate(_ event: Event, _ cell: EventListCell) {
        let date = event.date ?? ""
        cell.viewDate.isHidden = date.isEmpty
        cell.labelDate.text = date
    }

    private func showTime(_ event: Event, _ cell: EventListCell) {
        let time = event.time ?? ""
        cell.viewTime.isHidden = time.isEmpty
        cell.labelTime.text = time
    }

    private func loadEventList() {
        Api.events(day: nil, month: nil, year: nil, limit: nil, category: nil, lang: nil)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { response in
                guard let eventList = response.resource else {
//                    Show error
                    return
                }
                self.eventList = eventList
            }, onError: { error in
//                Show error
            })
            .disposed(by: disposeBag)
    }
}
