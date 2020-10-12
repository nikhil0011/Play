//
//  HomeView.swift
//  play
//
//  Created by Nikhil on 12/10/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit

class HomeView: UIView {
    lazy var sliderView = SliderView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    func setupView() {
        self.backgroundColor = .white
        self.addSubview(sliderView)
        addSubview(sliderView)
        sliderView.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.safeAreaLayoutGuide.trailingAnchor, padding: .zero, size: .init(width: 0, height: 200))
    }
    func configure() {
        sliderView.setNeedsDisplay()
        sliderView.configure(["https://is4-ssl.mzstatic.com/image/thumb/Podcasts113/v4/36/8f/43/368f43a6-c97d-f69e-dcae-6c9a3f08b196/mza_3740946593757410045.png/600x600bb.jpg","https://is4-ssl.mzstatic.com/image/thumb/Podcasts113/v4/36/8f/43/368f43a6-c97d-f69e-dcae-6c9a3f08b196/mza_3740946593757410045.png/600x600bb.jpg", "https://is4-ssl.mzstatic.com/image/thumb/Podcasts113/v4/36/8f/43/368f43a6-c97d-f69e-dcae-6c9a3f08b196/mza_3740946593757410045.png/600x600bb.jpg"])
    }
}
