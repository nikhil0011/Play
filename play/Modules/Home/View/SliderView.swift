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
        $0.scrollView.backgroundColor = .white
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
        $0.pageIndicatorTintColor = .cyan
        $0.currentPageIndicatorTintColor = .white
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init decoder has been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
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
}
