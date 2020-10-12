//
//  SliderView.swift
//  play
//
//  Created by Nikhil on 12/10/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit
final class SliderView: UIView {
    private lazy var scrollView = UIScrollView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .lightGray
        $0.delegate = self
        $0.isScrollEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = true
    }
    private lazy var contentView = UIView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
    }
    private lazy var pageControl = UIPageControl.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.currentPage = 0
        $0.pageIndicatorTintColor = .blue
        $0.addTarget(self, action: #selector(didTapOnPageControl), for: .touchUpInside)
        $0.currentPageIndicatorTintColor = .gray
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    func setupView() {
        self.addSubview(contentView)
        contentView.bounds = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,
                                        .flexibleHeight]
        contentView.addSubviews(scrollView, pageControl)
        scrollView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .zero, size: .init(width: 325, height: 200))
        pageControl.anchor(top: nil, leading: nil, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 8, right: 0))
        pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    func configure(_ images: [String]) {
        let containerWidth = 325.0
        let containerHeight = 200.0
        print("Container Height \(containerHeight)")
        print("Container width \(containerWidth)")
        for (index, url) in images.enumerated() {
            let imageview = UIImageView(frame: CGRect(x: containerWidth * Double(CGFloat(index)),
                                                      y: 0, width: containerWidth, height: containerHeight))
            imageview.load(url: url)
            imageview.contentMode = .scaleAspectFill
            imageview.clipsToBounds = true
            scrollView.addSubview(imageview)
        }
        scrollView.contentSize = CGSize(width: containerWidth * Double(CGFloat(images.count)), height: containerHeight)
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
