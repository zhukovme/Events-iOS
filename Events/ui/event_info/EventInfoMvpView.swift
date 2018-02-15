//
//  EventInfoMvpView.swift
//  Events
//
//  Created by Michael Zhukov on 14/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

protocol EventInfoMvpView: MvpView {
    func showLoading()
    func hideLoading()
    func showMessage(type: MessageType, message: String)
    func showEventInfo(eventInfo: EventInfo)
}
