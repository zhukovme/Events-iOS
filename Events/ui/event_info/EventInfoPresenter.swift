//
//  EventInfoPresenter.swift
//  Events
//
//  Created by Michael Zhukov on 14/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

class EventInfoPresenter: Presenter {
    private let eventsInteractor: EventsInteractor

    init(eventsInteractor: EventsInteractor) {
        self.eventsInteractor = eventsInteractor
    }

    private var view: EventInfoMvpView?

    func viewDidLoad(view: EventInfoMvpView, eventId: String?) {
        self.view = view
        loadEventInfo(eventId: eventId)
    }

    private func loadEventInfo(eventId: String?) {
        // TODO Load event info and show else show error
    }
}
