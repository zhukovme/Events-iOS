//
//  CategoryFilterViewController.swift
//  Events
//
//  Created by Michael Zhukov on 11/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import UIKit
import BEMCheckBox

class CategoryFilterViewController: ViewController<CategoryFilterPresenter>, CategoryFilterMvpView {
    @IBOutlet weak var cbConferences: BEMCheckBox!
    @IBOutlet weak var cbExhibitions: BEMCheckBox!
    @IBOutlet weak var cbFestivals: BEMCheckBox!
    @IBOutlet weak var cbAwards: BEMCheckBox!

    @IBAction func onCancelClick(_ sender: UIBarButtonItem) {
        presenter?.onCancelClick()
    }

    @IBAction func onSaveClick(_ sender: UIBarButtonItem) {
        presenter?.onSaveClick(conferences: cbConferences.on, exhibitions: cbExhibitions.on,
                                festivals: cbFestivals.on, awards: cbAwards.on)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(view: self)
    }

    func showCategories(conferences: Bool, exhibitions: Bool, festivals: Bool, awards: Bool) {
        cbConferences.on = conferences
        cbExhibitions.on = exhibitions
        cbFestivals.on = festivals
        cbAwards.on = awards
    }

    func dismissViewController() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
