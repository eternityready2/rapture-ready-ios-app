//
//  ThemeColorTBVC.swift
//  RaptureReady
//
//  Created by anca dev on 18/06/24.
//

import UIKit

class ThemeColorTBVC: UITableViewController {
    var colors = Array(Theme.colorDict.keys)
    var updateSettingsDelegate: UpdateSettingsProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colors.sort(by: {$0 < $1})
        
        self.navigationController?.navigationBar.backgroundColor = Theme.color
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorLabel", for: indexPath) as? ThemeColorTBVCell else {
            print("error")
            return UITableViewCell()
        }
        
        let labelColor = colors[indexPath.row]
        let themeColor = Theme.color
        
        cell.colorLabel.text = ""
        cell.colorLabel.text = labelColor
        cell.colorLabel.textColor = Theme.colorDict[labelColor]
        
        if cell.colorLabel.textColor == themeColor {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedColor = colors[indexPath.row]
        Theme.set(color: selectedColor)
        updateSettingsDelegate?.updateTheme()
        self.navigationController?.popViewController(animated: true)
        
        
        //        let themeUpdateAlert = UIAlertController(title: "Restart Now?", message: "In order to apply the new theme, the app must be restarted.", preferredStyle: .alert)
        //        let restartAction = UIAlertAction(title: "Restart", style: .destructive) { (_) in
        //            exit(0)
        //        }
        //        let cancelAction = UIAlertAction(title: "Later", style: .cancel) { (_) in
        //            self.dismiss(animated: true, completion: nil)
        //        }
        //        themeUpdateAlert.addAction(restartAction)
        //        themeUpdateAlert.addAction(cancelAction)
        //
        //        themeUpdateAlert.view.tintColor = Theme.color
        //        self.present(themeUpdateAlert, animated: true, completion: nil)
    }
}
