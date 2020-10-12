//
//  ViewController.swift
//  play
//
//  Created by Nikhil on 11/10/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let ui = HomeView()
    override func loadView() {
        self.view = ui
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        ui.configure()
    }
}

