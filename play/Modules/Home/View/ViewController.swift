//
//  ViewController.swift
//  play
//
//  Created by Nikhil on 11/10/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var sliderView = SliderView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        sliderView.setNeedsDisplay()
    }
    private func setupView() {
        let frame = self.view.safeAreaLayoutGuide
        self.view.addSubview(sliderView)
        sliderView.anchor(top: frame.topAnchor, leading: frame.leadingAnchor, bottom: nil, trailing: frame.trailingAnchor, padding: .zero, size: .init(width: 0, height: 200))
        sliderView.configure(["https://is4-ssl.mzstatic.com/image/thumb/Podcasts113/v4/36/8f/43/368f43a6-c97d-f69e-dcae-6c9a3f08b196/mza_3740946593757410045.png/600x600bb.jpg","https://is4-ssl.mzstatic.com/image/thumb/Podcasts113/v4/36/8f/43/368f43a6-c97d-f69e-dcae-6c9a3f08b196/mza_3740946593757410045.png/600x600bb.jpg", "https://is4-ssl.mzstatic.com/image/thumb/Podcasts113/v4/36/8f/43/368f43a6-c97d-f69e-dcae-6c9a3f08b196/mza_3740946593757410045.png/600x600bb.jpg"])
    }
}

