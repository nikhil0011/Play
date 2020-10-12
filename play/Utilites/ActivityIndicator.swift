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
	open func showGifProgressView(_ view: UIView) {
		containerView.frame = view.frame
		containerView.center = view.center
		if containerView.frame.origin.y > 0 {
			containerView.frame.origin.y = -64.0
		} else {
			containerView.frame.origin.y = 0.0
		}
		containerView.backgroundColor = UIColor(rgb: 0xffffff).withAlphaComponent(0.3)
		let gif = UIImage.gif(name: "Rolling-1s-200px")
		DispatchQueue.main.async {
			self.progressView.image = gif
		}
		progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
		progressView.center = view.center
		progressView.backgroundColor = UIColor(rgb: 0x444444).withAlphaComponent(0.7)
		progressView.backgroundColor = .clear
		progressView.clipsToBounds = true
		progressView.layer.cornerRadius = 10
		activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
		activityIndicator.style = .whiteLarge
		activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)
		activityIndicator.isHidden = true
		progressView.addSubview(activityIndicator)
		containerView.addSubview(progressView)
		view.addSubview(containerView)
		activityIndicator.startAnimating()
	}
	// Showing Progress view
	open func showProgressView(_ view: UIView) {
		view.endEditing(true)
		self.containerView.frame = view.frame
		self.containerView.center = view.center
		if self.containerView.frame.origin.y > 0 {
			self.containerView.frame.origin.y = -64.0
		} else {
			self.containerView.frame.origin.y = 0.0
		}
		self.containerView.backgroundColor = UIColor(rgb: 0xffffff).withAlphaComponent(0.3)
		self.progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
		self.progressView.center = view.center
		self.progressView.backgroundColor = UIColor(rgb: 0x444444).withAlphaComponent(0.7)
		self.progressView.clipsToBounds = true
		self.progressView.layer.cornerRadius = 10
		self.activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
		self.activityIndicator.style = .whiteLarge
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
