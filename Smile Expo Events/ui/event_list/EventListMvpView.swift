//
//  EventListMvpView.swift
//  Smile Expo Events
//
//  Created by Michael Zhukov on 05/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

protocol EventListMvpView {
    func reloadTable()
    func showError(message: String)
}
