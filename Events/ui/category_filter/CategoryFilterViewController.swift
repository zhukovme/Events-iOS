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
    // MARK: Views

    @IBOutlet weak var cbConferences: BEMCheckBox!
    @IBOutlet weak var cbExhibitions: BEMCheckBox!
    @IBOutlet weak var cbFestivals: BEMCheckBox!
    @IBOutlet weak var cbAwards: BEMCheckBox!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(view: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter?.onSaveClick(conferences: cbConferences.on, exhibitions: cbExhibitions.on,
                               festivals: cbFestivals.on, awards: cbAwards.on)
    }

    // MARK: Actions

    @IBAction func onCancelClick(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    // MARK: MVP protocol methods

    func showCategories(conferences: Bool, exhibitions: Bool, festivals: Bool, awards: Bool) {
        cbConferences.on = conferences
        cbExhibitions.on = exhibitions
        cbFestivals.on = festivals
        cbAwards.on = awards
    }

    // MARK: Private methods
}
