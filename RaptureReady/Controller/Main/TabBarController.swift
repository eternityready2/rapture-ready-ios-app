//
//  TabBarController.swift
//  RaptureReady
//
//  Created by anca dev on 18/06/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        UITabBarItem.appearance().setTitleTextAttributes(
            [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13)
            ], for: .normal)
    }
    
//    override var traitCollection: UITraitCollection {
//        let realTraits = super.traitCollection
//        let fakeTraits = UITraitCollection(horizontalSizeClass: .compact)
//        
//        return UITraitCollection(traitsFrom: [realTraits, fakeTraits])
//    }
}
