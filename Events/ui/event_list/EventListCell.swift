//
//  EventListItemTableViewCell.swift
//  Events
//
//  Created by Michael Zhukov on 05/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import UIKit

class EventListCell: ListCell {
    @IBOutlet weak var ivImage: UIImageView! {
        didSet {
            ivImage.roundCorners()
        }
    }
    @IBOutlet weak var labelTitle: UILabel!

    @IBOutlet weak var viewLocation: UIView!
    @IBOutlet weak var labelLocation: UILabel!

    @IBOutlet weak var viewDate: UIView!
    @IBOutlet weak var labelDate: UILabel!

    @IBOutlet weak var viewTime: UIView!
    @IBOutlet weak var labelTime: UILabel!

    override func configure(for viewObject: ViewObject) {
        if let event = viewObject as? Event {
            labelTitle.text = event.title ?? ""
            ivImage.loadImage(url: event.imageUrl)
            showLocation(event.location?.fromHtml ?? "")
            showDate(event.date ?? "")
            showTime(event.time ?? "")
        }
    }

    private func showLocation(_ location: String) {
        viewLocation.isHidden = location.isEmpty
        labelLocation.text = location
    }

    private func showDate(_ date: String) {
        viewDate.isHidden = date.isEmpty
        labelDate.text = date
    }

    private func showTime(_ time: String) {
        viewTime.isHidden = time.isEmpty
        labelTime.text = time
    }
}
