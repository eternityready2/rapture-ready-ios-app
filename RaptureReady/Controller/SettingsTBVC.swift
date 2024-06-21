//
//  SettingsTBVC.swift
//  RaptureReady
//
//  Created by anca dev on 18/06/24.
//

import UIKit

class SettingsTBVC: UITableViewController {
    
    //MARK: - Need to add in the appID once it is in the store
    fileprivate let appID = "6504472407"
    
    override func viewWillAppear(_ animated: Bool) {
        updateTheme()
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTheme()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
        case [0,0]:
            break
        case [0,1]:
            break
        case [0,2]:
            rateApp()
        case [0,3]:
            share(indexPath: indexPath)
        case [0,4]:
            break
        default:
            print("Cell selected has no action")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func rateApp() {
        let storeLink = URL(string: "itms-apps://itunes.apple.com/us/app/id\(appID)?action=write-review")
        if UIApplication.shared.canOpenURL(storeLink!) {
            UIApplication.shared.open(storeLink!)
        }
    }
    
    private func share(indexPath: IndexPath) {
        let shareCell = tableView.cellForRow(at: indexPath)
        let shareLink = URL(string: "itms-apps://itunes.apple.com/us/app/id\(appID)")
        let shareSheet = UIActivityViewController(activityItems: [shareLink!], applicationActivities: .none)
        shareSheet.popoverPresentationController?.sourceView = shareCell
        present(shareSheet, animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier {
        case "ThemeSelection":
            let themeVC = segue.destination as? ThemeColorTBVC
            themeVC?.updateSettingsDelegate = self
        case "About":
            break
        case "DeepSettings":
            break
        default:
            print("No identifier found")
        }
    }
}

extension SettingsTBVC: UpdateSettingsProtocol {
    func updateTheme() {
        self.navigationController?.navigationBar.backgroundColor = Theme.color
        self.tabBarController?.tabBar.tintColor = Theme.color
        self.tabBarController?.moreNavigationController.navigationBar.backgroundColor = Theme.color
    }
}
