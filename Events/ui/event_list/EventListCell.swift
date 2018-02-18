//
//  EventListItemTableViewCell.swift
//  Events
//
//  Created by Michael Zhukov on 05/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import UIKit

class EventListCell: ListCell {
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!

    @IBOutlet weak var ivLocation: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!

    @IBOutlet weak var ivDate: UIImageView!
    @IBOutlet weak var labelDate: UILabel!

    @IBOutlet weak var ivTime: UIImageView!
    @IBOutlet weak var labelTime: UILabel!

    override func configure(for viewObject: ViewObject) {
        if let event = viewObject as? EventItem {
            labelTitle.text = event.title ?? ""
            ivImage.loadImage(url: event.imageUrl)
            ivImage.roundCorners()
            labelLocation.textOrHide(text: event.location?.fromHtml, alsoHide: ivLocation)
            labelDate.textOrHide(text: event.date, alsoHide: ivDate)
            labelTime.textOrHide(text: event.time, alsoHide: ivTime)
        }
    }
}
