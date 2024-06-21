//
//  ViewController.swift
//  RaptureReady
//
//  Created by anca dev on 18/06/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tabCollectionView: UICollectionView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var mediaLabel: UILabel!
    @IBOutlet weak var connectLabel: UILabel!
    @IBOutlet weak var mediaTabCollectionView: UICollectionView!
    @IBOutlet weak var otherTabCollectionView: UICollectionView!
    
    private var categoriesTitle: [String] {
        var title = [String]()
        
        homeTab.allCases.forEach { item in
            title.append(item.Title)
        }
        
        return title
    }
    
    private var categoriesIcon: [String] {
        var iconName = [String]()
        
        homeTab.allCases.forEach { item in
            iconName.append(item.Icon)
        }
        
        return iconName
    }
    
    private var otherCategoriesTitle: [String] {
        var title = [String]()
        
        otherHomeTab.allCases.forEach { item in
            title.append(item.Title)
        }
        
        return title
    }
    
    private var otherCategoriesIcon: [String] {
        var iconName = [String]()
        
        otherHomeTab.allCases.forEach { item in
            iconName.append(item.Icon)
        }
        
        return iconName
    }
    
    private var mediaCategoriesTitle: [String] {
        var title = [String]()
        
        Media.allCases.forEach { item in
            title.append(item.Title)
        }
        
        return title
    }
    
    private var mediaCategoriesIcon: [String] {
        var iconName = [String]()
        
        Media.allCases.forEach { item in
            iconName.append(item.Icon)
        }
        
        return iconName
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        tabCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "tabCell")
        otherTabCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "tabCell")
        mediaTabCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "tabCell")
        
        underLineText(welcomeLabel)
        underLineText(mediaLabel)
        underLineText(connectLabel)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tabCollectionView {
            return categoriesTitle.count
        } else if collectionView == mediaTabCollectionView {
            return mediaCategoriesIcon.count
        } else if collectionView == otherTabCollectionView {
            return otherCategoriesTitle.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tabCell", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if collectionView == tabCollectionView {
            cell.tabImage.image = UIImage(systemName: categoriesIcon[indexPath.row])
            cell.tabTitle.text = categoriesTitle[indexPath.row]
        } else if collectionView == mediaTabCollectionView {
            cell.tabImage.image = UIImage(systemName: mediaCategoriesIcon[indexPath.row])
            cell.tabTitle.text = mediaCategoriesTitle[indexPath.row]
        } else if collectionView == otherTabCollectionView {
            cell.tabImage.image = UIImage(systemName: otherCategoriesIcon[indexPath.row])
            cell.tabTitle.text = otherCategoriesTitle[indexPath.row]
        }
        
        return cell
    }
    
    func collectionView(_ collection: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = 20
        let availableWidth = collection.bounds.width - CGFloat(paddingSpace)
        let widthItem = availableWidth / 3
        let availableHeight = collection.bounds.height - 30
        let heightItem = availableHeight / 8
        
        return CGSize(width: widthItem, height: heightItem)
    }
    
    func collectionView(_ collection: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var itemTitle = String()
        
        if collection == tabCollectionView {
            itemTitle = categoriesTitle[indexPath.row]
        } else if collection == mediaTabCollectionView {
            itemTitle = mediaCategoriesTitle[indexPath.row]
        } else if collection == otherTabCollectionView {
            itemTitle = otherCategoriesTitle[indexPath.row]
        }
        
        if itemTitle == "Rapture Ready" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let rrVC = storyboard.instantiateViewController(withIdentifier: "RRVC") as? RaptureReadyViewController else { return }
            
            self.navigationController?.pushViewController(rrVC, animated: true)
        } else if itemTitle == "Rapture Index" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let raptureIndexVC = storyboard.instantiateViewController(withIdentifier: "RaptureIndexVC") as? RaptureIndexViewController else { return }
            
            self.navigationController?.pushViewController(raptureIndexVC, animated: true)
        } else if itemTitle == "RR News" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let rrNewsVC = storyboard.instantiateViewController(withIdentifier: "RRNewsVC") as? RRNewsViewController else { return }
            
            self.navigationController?.pushViewController(rrNewsVC, animated: true)
        } else if itemTitle == "Rapture Ready TV" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let videosVC = storyboard.instantiateViewController(withIdentifier: "VideosVC") as? VideosViewController else { return }
            
            self.navigationController?.pushViewController(videosVC, animated: true)
        } else if itemTitle == "Watch TV" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let watchTV = storyboard.instantiateViewController(withIdentifier: "WatchTVVC") as? TVVC else { return }
            
            self.navigationController?.pushViewController(watchTV, animated: true)
        } else if itemTitle == "Podcasts" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let podcastsVC = storyboard.instantiateViewController(withIdentifier: "PodcastsVC") as? PodcastsViewController else { return }
            
            self.navigationController?.pushViewController(podcastsVC, animated: true)
        } else if itemTitle == "Radio" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let radioVC = storyboard.instantiateViewController(withIdentifier: "RadioVC") as? RadioVC else { return }
            
            self.navigationController?.pushViewController(radioVC, animated: true)
        } else if itemTitle == "On Demand" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let odVC = storyboard.instantiateViewController(withIdentifier: "ODVC") as? OnDemandViewController else { return }
            
            self.navigationController?.pushViewController(odVC, animated: true)
        } else if itemTitle == "Videos" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let videosVC = storyboard.instantiateViewController(withIdentifier: "VideosVC") as? VideosViewController else { return }
            
            self.navigationController?.pushViewController(videosVC, animated: true)
        } else if itemTitle == "Read Bible" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let rbVC = storyboard.instantiateViewController(withIdentifier: "RBVC") as? ProphecyVC else { return }
            
            self.navigationController?.pushViewController(rbVC, animated: true)
        } else if itemTitle == "Contact" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let contactVC = storyboard.instantiateViewController(withIdentifier: "ContactVC") as? ContactVC else { return }
            
            self.navigationController?.pushViewController(contactVC, animated: true)
        } else if itemTitle == "Donate" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let donateVC = storyboard.instantiateViewController(withIdentifier: "DonateVC") as? DonateViewController else { return }
            
            self.navigationController?.pushViewController(donateVC, animated: true)
        } else if itemTitle == "Facebook" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let facebookVC = storyboard.instantiateViewController(withIdentifier: "FacebookVC") as? FacebookVC else { return }
            
            self.navigationController?.pushViewController(facebookVC, animated: true)
        } else if itemTitle == "Settings" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let settingsVC = storyboard.instantiateViewController(withIdentifier: "SettingsVC") as? SettingsTBVC else { return }
            
            self.navigationController?.pushViewController(settingsVC, animated: true)
        } else if itemTitle == "Nearing Midnight" {
            let storyboard = UIStoryboard(name: "ExtraLink", bundle: nil)
            guard let nmVC = storyboard.instantiateViewController(withIdentifier: "NRVC") as? NRViewController else { return }
            
            self.navigationController?.pushViewController(nmVC, animated: true)
        } else if itemTitle == "Israel Watch" {
            let storyboard = UIStoryboard(name: "ExtraLink", bundle: nil)
            guard let iwVC = storyboard.instantiateViewController(withIdentifier: "IWatchVC") as? IWViewController else { return }
            
            self.navigationController?.pushViewController(iwVC, animated: true)
        } else if itemTitle == "Prayer Center" {
            let storyboard = UIStoryboard(name: "ExtraLink", bundle: nil)
            guard let pcVC = storyboard.instantiateViewController(withIdentifier: "PCVC") as? PCViewController else { return }
            
            self.navigationController?.pushViewController(pcVC, animated: true)
        } else if itemTitle == "RR Forums" {
            let storyboard = UIStoryboard(name: "ExtraLink", bundle: nil)
            guard let rrfVC = storyboard.instantiateViewController(withIdentifier: "RRFVC") as? RRForumsViewController else { return }
            
            self.navigationController?.pushViewController(rrfVC, animated: true)
        } else if itemTitle == "Vertizontal Media" {
            let storyboard = UIStoryboard(name: "ExtraLink", bundle: nil)
            guard let vmVC = storyboard.instantiateViewController(withIdentifier: "VMVC") as? VMViewController else { return }
            
            self.navigationController?.pushViewController(vmVC, animated: true)
        } else if itemTitle == "End Time Writers" {
            let storyboard = UIStoryboard(name: "ExtraLink", bundle: nil)
            guard let etwVC = storyboard.instantiateViewController(withIdentifier: "ETWVC") as? ETWViewController else { return }
            
            self.navigationController?.pushViewController(etwVC, animated: true)
        } else if itemTitle == "Christian Classics" {
            let storyboard = UIStoryboard(name: "ExtraLink", bundle: nil)
            guard let ccVC = storyboard.instantiateViewController(withIdentifier: "CCVC") as? CCViewController else { return }
            
            self.navigationController?.pushViewController(ccVC, animated: true)
        } else if itemTitle == "TV Channels" {
            let storyboard = UIStoryboard(name: "Media", bundle: nil)
            guard let tvcVC = storyboard.instantiateViewController(withIdentifier: "TVCVC") as? TVCViewController else { return }
            
            self.navigationController?.pushViewController(tvcVC, animated: true)
        } else if itemTitle == "Music Videos" {
            let storyboard = UIStoryboard(name: "Media", bundle: nil)
            guard let mvVC = storyboard.instantiateViewController(withIdentifier: "MVVC") as? MVViewController else { return }
            
            self.navigationController?.pushViewController(mvVC, animated: true)
        }
    }
    
}

extension HomeViewController {
    
    private func underLineText(_ label: UILabel) {
        let bottomLine = UIView()
        bottomLine.backgroundColor = .blue
        
        self.view.addSubview(bottomLine)
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomLine.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 3),
            bottomLine.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            bottomLine.widthAnchor.constraint(equalToConstant: 44),
            bottomLine.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    
}
