//
//  EventInfoPresenter.swift
//  Events
//
//  Created by Michael Zhukov on 14/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import RxSwift

class EventInfoPresenter: Presenter {
    private let eventsInteractor: EventsInteractor

    init(eventsInteractor: EventsInteractor) {
        self.eventsInteractor = eventsInteractor
    }

    private var view: EventInfoMvpView?
    private let disposeBag = DisposeBag()

    func viewDidLoad(view: EventInfoMvpView, eventId: String?) {
        self.view = view
        if eventId != nil {
            loadEventInfo(eventId: eventId!)
        } else {
            view.showMessage(type: .error, message: "Something went wrong")
        }
    }

    private func loadEventInfo(eventId: String) {
        eventsInteractor.getEvent(eventId: eventId)
            .applySchedulers()
            .do(onSubscribe: {
                self.view?.showLoading()
            }, onDispose: {
                self.view?.hideLoading()
            })
            .subscribe(onNext: { eventInfo in
                if eventInfo != nil {
                    self.view?.showEventInfo(eventInfo: eventInfo!)
                }
            }, onError: { error in
                self.view?.showMessage(type: .error, message: "Server error")
            })
            .disposed(by: disposeBag)
    }
}
