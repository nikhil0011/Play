//
//  SliderView.swift
//  play
//
//  Created by Nikhil on 12/10/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit

class SliderView: UIView {
    private lazy var scrollView = UIScrollView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        $0.delegate = self
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = true
    }
    private lazy var contentView = UIView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.isHidden = true
    }
    private lazy var pageControl = UIPageControl.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.currentPage = 0
        $0.pageIndicatorTintColor = .blue
        $0.addTarget(self, action: #selector(didTapOnPageControl), for: .touchUpInside)
        $0.currentPageIndicatorTintColor = .white
    }
    override func draw(_ rect: CGRect) {
        setupView()
    }
    func setupView() {
        addSubview(contentView)
        contentView.bounds = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.addSubview(scrollView)
        contentView.addSubview(pageControl)
        scrollView.fillSuperview()
        pageControl.anchor(top: nil, leading: nil, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 8, right: 0))
        pageControl.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
    }
    func configure(_ images: [String]) {
        let containerWidth = self.scrollView.frame.width
        let containerHeight = self.scrollView.frame.height
        for (index, url) in images.enumerated() {
            let imageview = UIImageView(frame: CGRect(x: containerWidth * CGFloat(index),
                                                      y: 0, width: containerWidth, height: containerHeight))
            imageview.load(url: url)
            imageview.contentMode = .scaleAspectFill
            imageview.clipsToBounds = true
            scrollView.addSubview(imageview)
        }
        scrollView.contentSize = CGSize(width: containerWidth * CGFloat(images.count), height: containerHeight)
        pageControl.numberOfPages = images.count
    }
    @objc func didTapOnPageControl(sender: UIPageControl?) {
        scrollTo(index: sender?.currentPage ?? 0)
    }
    private func scrollTo(index: Int) {
        let containerWidth = self.scrollView.frame.width
        let containerHeight = self.scrollView.frame.height
        let posX = containerWidth * CGFloat(index)
        scrollView.scrollRectToVisible(CGRect(x: posX, y: 0, width: containerWidth, height: containerHeight), animated: true)
    }
}
extension SliderView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let containerWidth = self.scrollView.frame.width
        let currentPage: CGFloat = floor((self.scrollView.contentOffset.x - containerWidth / 2) / containerWidth) + 1
        pageControl.currentPage = Int(currentPage)
    }
}
