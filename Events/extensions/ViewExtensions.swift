//
//  ViewExtensions.swift
//  Events
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

extension UIRefreshControl {
    func beginRefreshingWithAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            if let scrollView = self.superview as? UIScrollView {
                scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y - self.frame.height),
                                            animated: true)
            }
            self.beginRefreshing()
        }
    }
}

extension UILabel {
    func textOrHide(text: String?, alsoHide: UIView? = nil) {
        if let text = text, !text.isEmpty {
            self.text = text
        } else {
            addZeroHeightConstraint()
            self.isHidden = true
            alsoHide?.addZeroHeightConstraint()
            alsoHide?.isHidden = true
        }
    }
}

extension UIView {
    internal func addZeroHeightConstraint() {
        addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.height,
                                         relatedBy: NSLayoutRelation.equal, toItem: nil,
                                         attribute: NSLayoutAttribute.notAnAttribute,
                                         multiplier: 1, constant: 0))
        layoutIfNeeded()
    }
}
