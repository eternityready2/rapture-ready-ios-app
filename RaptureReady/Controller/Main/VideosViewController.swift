//
//  VideosViewController.swift
//  RaptureReady
//
//  Created by anca dev on 19/06/24.
//

import UIKit
import WebKit

class VideosViewController: UIViewController {
    
    private let webView = CustomWebView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.backgroundColor = Theme.color
        self.tabBarController?.tabBar.tintColor = Theme.color
        self.tabBarController?.moreNavigationController.navigationBar.backgroundColor = Theme.color
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.load(SiteURLs.Videos)
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        loader()
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }

    @IBAction func goForward(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func goRefresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
}

extension VideosViewController: WKUIDelegate, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        
        return nil
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation) {
        dismissLoader()
        
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
        
        webViewSetup(webView)
    }
    
}
