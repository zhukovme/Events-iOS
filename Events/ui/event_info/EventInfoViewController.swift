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

    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var btnBeThere: UIButton!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelUrl: UILabel!
    @IBOutlet weak var labelDescritpion: UILabel!

    // MARK: Lifecycle

    var eventId: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(view: self, eventId: eventId)
    }

    // MARK: Actions

    // MARK: MVP protocol methods

    // MARK: Private methods
}
