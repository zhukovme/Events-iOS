//
//  EventListPresenter.swift
//  Events
//
//  Created by Michael Zhukov on 05/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import RxSwift

class EventListPresenter: TablePresenter {
    private let eventsInteractor: EventsInteractor

    init(eventsInteractor: EventsInteractor) {
        self.eventsInteractor = eventsInteractor
    }

    private var view: EventListMvpView?
    private let disposeBag = DisposeBag()

    func viewDidLoad(view: EventListMvpView) {
        self.view = view
        cellIdentifier = "EventListCell"
        loadEventList()
    }

    func onRefresh() {
        loadEventList()
    }

    func onCellClick(row: Int) {
    }

    private func loadEventList() {
        eventsInteractor.getEvents()
            .applySchedulers()
            .do(onSubscribe: {
                self.view?.showRefreshing()
            }, onDispose: {
                self.view?.hideRefreshing()
            })
            .subscribe(onNext: { events in
                if events.isEmpty {
                    self.view?.showMessage(type: .info, message: "No events")
                }
                self.setTableItems(events)
                self.view?.reloadTable()
            }, onError: { error in
                self.view?.showMessage(type: .error, message: "Server error")
            })
            .disposed(by: disposeBag)
    }
}
