//
//  CustomWebView.swift
//  RaptureReady
//
//  Created by anca dev on 18/06/24.
//

import Foundation
import WebKit

class CustomWebView: WKWebView {
    
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}


