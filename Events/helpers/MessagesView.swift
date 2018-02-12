//
//  MessageView.swift
//  Events
//
//  Created by Michael Zhukov on 11/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import SwiftMessages

enum MessageType {
    case success
    case info
    case warning
    case error
}

class MessagesView {
    func show(type: MessageType, body: String) {
        let config = setupCongif()
        let view = setupView(type: type, body: body)
        SwiftMessages.show(config: config, view: view)
    }

    private func setupCongif() -> SwiftMessages.Config {
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        config.duration = .seconds(seconds: 2.0)
        config.dimMode = .gray(interactive: true)
        config.preferredStatusBarStyle = .lightContent
//        config.eventListeners.append() { event in
//            if case .didHide = event {
//            }
//        }
        return config
    }

    private func setupView(type: MessageType, body: String) -> MessageView {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureDropShadow()
        let title: String
        switch type {
        case .success:
            title = "Success"
            view.configureTheme(.success)
            break
        case .info:
            title = "Info"
            view.configureTheme(.info)
            break
        case .warning:
            title = "Warning"
            view.configureTheme(.warning)
            break
        case .error:
            title = "Error"
            view.configureTheme(.error)
            break
        }
        view.button?.isHidden = true
        view.configureContent(title: title, body: body)
        return view
    }
}
