//
//  EventListItemTableViewCell.swift
//  Smile Expo Events
//
//  Created by Michael Zhukov on 05/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import UIKit

class EventListCell: UITableViewCell {
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
}
