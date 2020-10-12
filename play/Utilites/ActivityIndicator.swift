//
//  ActivityIndicator.swift
//  Coolwinks
//
//  Created by Gunjan on 04/09/18.
//  Copyright © 2018 Gunjan. All rights reserved.
//

import Foundation
import UIKit
open class ActivityIndicator {
	var containerView = UIView()
	var progressView = UIImageView()
	var activityIndicator = UIActivityIndicatorView()
	open class var shared: ActivityIndicator {
		struct Static {
			static let instance: ActivityIndicator = ActivityIndicator()
		}
		return Static.instance
	}

	// Showing Progress view
	open func showProgressView(_ view: UIView) {
		view.endEditing(true)
		self.containerView.frame = view.frame
		self.containerView.center = view.center
        self.containerView.frame.origin.y = self.containerView.frame.origin.y > 0 ? -64.0 : 0.0
		self.containerView.backgroundColor = UIColor(rgb: 0xffffff).withAlphaComponent(0.3)
		self.progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
		self.progressView.center = view.center
		self.progressView.backgroundColor = UIColor(rgb: 0x444444).withAlphaComponent(0.7)
		self.progressView.clipsToBounds = true
		self.progressView.layer.cornerRadius = 10
		self.activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
		self.activityIndicator.style = .large
		self.activityIndicator.center = CGPoint(x: self.progressView.bounds.width / 2, y: self.progressView.bounds.height / 2)
		self.progressView.addSubview(self.activityIndicator)
		self.containerView.addSubview(self.progressView)
		view.addSubview(self.containerView)
		self.activityIndicator.startAnimating()
	}
	open func hideProgressView() {
		self.activityIndicator.stopAnimating()
		self.containerView.removeFromSuperview()
	}
}
