//
//  DeepSettingsTBVC.swift
//  RaptureReady
//
//  Created by anca dev on 18/06/24.
//

import UIKit

class DeepSettingsTBVC: UITableViewController {

    @IBOutlet weak var appVersion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        // get the build number of the application
        let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
        
        appVersion.text = "App Version: \(version!), Build Number: \(build!)"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
