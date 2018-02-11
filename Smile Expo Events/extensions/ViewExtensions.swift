//
//  ViewExtensions.swift
//  Smile Expo Events
//
//  Created by Michael Zhukov on 04/02/2018.
//  Copyright © 2018 Michael Zhukov. All rights reserved.
//

import Kingfisher

extension UIImageView {
    func loadImage(url: String?) {
        kf.setImage(with: URL(string: url ?? ""),
                    placeholder: #imageLiteral(resourceName:"placeholder"),
                    options: [.transition(ImageTransition.fade(1))])
    }

    func roundCorners() {
        layer.cornerRadius = 2.0
        clipsToBounds = true
    }
}
