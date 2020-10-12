//
//  Createable.swift
//  Coolwinks
//
//  Created by Nikhil on 01/10/20.
//  Copyright © 2020 Gunjan. All rights reserved.
//

import UIKit

protocol Creatable: UIView {
    init()
}

extension Creatable {
    static func create(_ builder: (Self) -> Void) -> Self {
        let view = Self.init()
        builder(view)
        return view
    }
    
    func configure(_ modifier: (Self) -> Void) -> Self {
        modifier(self)
        return self
    }
}

extension UIView: Creatable {}
