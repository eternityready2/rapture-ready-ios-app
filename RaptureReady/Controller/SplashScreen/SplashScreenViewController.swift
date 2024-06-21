//
//  SplashScreenViewController.swift
//  RaptureReady
//
//  Created by anca dev on 18/06/24.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                guard let tabBarVC = storyboard.instantiateViewController(identifier: "tabBar") as? TabBarController else { return }
                
                sceneDelegate.window?.rootViewController = tabBarVC
                sceneDelegate.window?.makeKeyAndVisible()
            }
        }
    }

}
