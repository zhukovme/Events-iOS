//
//  EventInfoViewController.swift
//  Events
//
//  Created by Michael Zhukov on 14/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import UIKit

class EventInfoViewController: ViewController<EventInfoPresenter>, EventInfoMvpView {
    // MARK: Views

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var svMain: UIScrollView!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var ivDate: UIImageView!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var ivTime: UIImageView!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var ivLocation: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var ivEmail: UIImageView!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var ivUrl: UIImageView!
    @IBOutlet weak var labelUrl: UILabel!
    @IBOutlet weak var labelDescritpion: UILabel!

    // MARK: Lifecycle

    var messagesView: MessagesView?
    var eventId: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        svMain.isHidden = true
        presenter?.viewDidLoad(view: self, eventId: eventId)
    }

    // MARK: Actions

    // MARK: MVP protocol methods

    func showLoading() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }

    func hideLoading() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }

    func showMessage(type: MessageType, message: String) {
        messagesView?.show(type: type, body: message)
    }

    func showEventInfo(eventInfo: EventInfo) {
        ivImage.loadImage(url: eventInfo.imageUrl)
        ivImage.roundCorners()
        labelTitle.text = eventInfo.title ?? ""
        labelDate.textOrHide(text: eventInfo.date, alsoHide: ivDate)
        labelTime.textOrHide(text: eventInfo.time, alsoHide: ivTime)
        labelLocation.textOrHide(text: eventInfo.location?.fromHtml, alsoHide: ivLocation)
        labelEmail.textOrHide(text: eventInfo.email, alsoHide: ivEmail)
        labelUrl.textOrHide(text: eventInfo.url, alsoHide: ivUrl)
        labelDescritpion.text = eventInfo.descriptionShort?.fromHtml ?? ""
        svMain.isHidden = false
    }

    // MARK: Private methods
}
