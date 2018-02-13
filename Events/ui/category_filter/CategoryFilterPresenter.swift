//
//  CategoryFilterPresenter.swift
//  Events
//
//  Created by Michael Zhukov on 11/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

class CategoryFilterPresenter: Presenter {
    private let eventsInteractor: EventsInteractor

    init(eventsInteractor: EventsInteractor) {
        self.eventsInteractor = eventsInteractor
    }

    private var view: CategoryFilterMvpView?

    func viewDidLoad(view: CategoryFilterMvpView) {
        self.view = view
        let categories = eventsInteractor.categories
        view.showCategories(conferences: categories.conferences,
                            exhibitions: categories.exhibitions,
                            festivals: categories.festivals,
                            awards: categories.awards)
    }

    func onSaveClick(conferences: Bool, exhibitions: Bool, festivals: Bool, awards: Bool) {
        eventsInteractor.categories = EventsCategories(conferences: conferences, exhibitions: exhibitions,
                                                          festivals: festivals, awards: awards)
    }
}
