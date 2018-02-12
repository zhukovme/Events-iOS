//
//  EventListMvpView.swift
//  Events
//
//  Created by Michael Zhukov on 05/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

protocol EventListMvpView: MvpView {
    func showRefreshing()
    func hideRefreshing()
    func reloadTable()
    func showMessage(type: MessageType, message: String)
}
