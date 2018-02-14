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

    @IBOutlet weak var ivLocation: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!

    @IBOutlet weak var ivDate: UIImageView!
    @IBOutlet weak var labelDate: UILabel!

    @IBOutlet weak var ivTime: UIImageView!
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
        labelLocation.text = location
        ivLocation.isHidden = location.isEmpty
        labelLocation.isHidden = location.isEmpty
    }

    private func showDate(_ date: String) {
        ivDate.isHidden = date.isEmpty
        labelDate.isHidden = date.isEmpty
        labelDate.text = date
    }

    private func showTime(_ time: String) {
        ivTime.isHidden = time.isEmpty
        labelTime.isHidden = time.isEmpty
        labelTime.text = time
    }
}
