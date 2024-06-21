//
//  Theme.swift
//  RaptureReady
//
//  Created by anca dev on 18/06/24.
//

import Foundation
import UIKit

class Theme {
    
    static var color: UIColor {
        let setColor = UserDefaults.standard.string(forKey: UserDefaultKeys.tintColor)
        return colorDict[setColor ?? "Blue"] ?? .systemBlue
    }
    
    static var colorDict: [String:UIColor] =
    [
        "Blue": .systemBlue,
        "Red": .systemRed,
        "Yellow": .systemYellow,
        "Green": .systemGreen,
        "Purple": .systemPurple,
        "Pink": .systemPink,
        "Teal": .systemTeal,
        "Orange": .systemOrange
    ]
    
    static func set(color: String) {
        UserDefaults.standard.setValue(color, forKey: UserDefaultKeys.tintColor)
    }
}
