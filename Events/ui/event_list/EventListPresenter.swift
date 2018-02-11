//
//  EventListPresenter.swift
//  Events
//
//  Created by Michael Zhukov on 05/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import RxSwift

class EventListPresenter: TablePresenter {
    private let api: Api

    init(api: Api) {
        self.api = api
    }

    private var view: EventListMvpView?

    private let disposeBag = DisposeBag()
    private var eventList: [Event] = [] {
        didSet {
            setTableItems(eventList)
            view?.reloadTable()
        }
    }

    func viewDidLoad(view: EventListMvpView) {
        self.view = view
        cellIdentifier = "EventListCell"
        loadEventList()
    }

    func onCellClick(row: Int) {
    }

    private func loadEventList() {
        api.events(params: nil)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { response in
                guard let eventList = response.resource else {
                    self.view?.showError(message: "Error")
                    return
                }
                self.eventList = eventList
            }, onError: { error in
                self.view?.showError(message: "Error")
            })
            .disposed(by: disposeBag)
    }
}
