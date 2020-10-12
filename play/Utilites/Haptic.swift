//
//  Haptic.swift
//  Coolwinks
//
//  Created by Nikhil on 25/07/19.
//  Copyright © 2019 Gunjan. All rights reserved.
//

import Foundation
class Haptic {
    static let instance = Haptic()
    var lightEffect: Bool? {
        didSet {
            guard let effect = lightEffect, effect else {
                return
            }
            TapticEngine.impact.feedback(.light)
        }
    }
    var feedbackEffect: Bool? {
        didSet {
            guard let effect = feedbackEffect, effect else {
                return
            }
            TapticEngine.selection.feedback()
        }
    }
    var errorEffect: Bool? {
        didSet {
            guard let effect = errorEffect, effect else {
                return
            }
            TapticEngine.notification.feedback(.error)
        }
    }
    var warningEffect: Bool? {
        didSet {
            guard let effect = errorEffect, effect else {
                return
            }
            TapticEngine.notification.feedback(.warning)

        }
    }
    var successEffect: Bool? {
        didSet {
            guard let effect = successEffect, effect else {
                return
            }
            TapticEngine.impact.feedback(.light)
        }
    }

}
