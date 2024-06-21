//
//  AboutVC.swift
//  RaptureReady
//
//  Created by anca dev on 18/06/24.
//

import UIKit
import SafariServices

class AboutVC: UIViewController, SFSafariViewControllerDelegate {

    @IBOutlet weak var versionNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        versionNumber.text = "Version \(version!)"
    }
    
    @IBAction func openPrivacyPolicy(_ sender: UIButton) {
        let privacyPolicyLink = URL(string: "https://www.eternityready.com/page.php?p=7")
        let safariController = SFSafariViewController(url: privacyPolicyLink!)
        present(safariController, animated: true, completion: nil)
    }
}
