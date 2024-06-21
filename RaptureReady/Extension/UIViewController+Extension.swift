//
//  UIViewController+Extension.swift
//  RaptureReady
//
//  Created by anca dev on 19/06/24.
//

import UIKit
import WebKit
import NVActivityIndicatorView

extension UIViewController {
    
    func loader() {
        self.view.backgroundColor = .white
        
        let loader = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 44, height: 44), type: .circleStrokeSpin, color: Theme.color)
        loader.tag = -244564
        loader.startAnimating()
        
        self.view.addSubview(loader)
        
        loader.center = self.view.center
    }
    
    func dismissLoader() {
        guard let loader = self.view.subviews.first(where: { $0.tag == -244564 }) as? NVActivityIndicatorView else { return }
        
        loader.stopAnimating()
    }
    
    func webViewSetup(_ webView: WKWebView) {
        self.view.addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            webView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            webView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
