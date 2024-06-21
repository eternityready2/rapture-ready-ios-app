//
//  Review.swift
//  RaptureReady
//
//  Created by anca dev on 18/06/24.
//

import Foundation
import StoreKit

class Review {
    
    
    static func count() {
        var count = UserDefaults.standard.integer(forKey: UserDefaultKeys.reviewCompletedCountKey)
        count += 1
        UserDefaults.standard.set(count, forKey: UserDefaultKeys.reviewCompletedCountKey)
        
        print("Process completed \(count) times")
        
    }
    
    static func prompt() {
        let count = UserDefaults.standard.integer(forKey: UserDefaultKeys.reviewCompletedCountKey)
        
        let infoDictionaryKey = kCFBundleVersionKey as String
        guard let currentVersion = Bundle.main.object(forInfoDictionaryKey: infoDictionaryKey) as? String
        else {
            fatalError("Expected to find a bundle version in the info dictionary")
        }
        
        let lastVersionPromptedForReview = UserDefaults.standard.string(forKey: UserDefaultKeys.lastVersionPromptedForReviewKey)
        
        if count >= 3 && currentVersion != lastVersionPromptedForReview {
            let twoSecondsFromNow = DispatchTime.now() + 1.0
            DispatchQueue.main.asyncAfter(deadline: twoSecondsFromNow) {
                SKStoreReviewController.requestReview()
                UserDefaults.standard.set(currentVersion, forKey: UserDefaultKeys.lastVersionPromptedForReviewKey)
            }
        }
        
    }
}
