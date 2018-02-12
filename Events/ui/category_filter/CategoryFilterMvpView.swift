//
//  CategoryFilterMvpView.swift
//  Events
//
//  Created by Michael Zhukov on 12/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

protocol CategoryFilterMvpView: MvpView {
    func showCategories(conferences: Bool, exhibitions: Bool, festivals: Bool, awards: Bool)
    func dismissViewController()
}
