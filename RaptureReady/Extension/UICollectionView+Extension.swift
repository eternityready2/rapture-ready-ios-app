//
//  UICollectionView+Extension.swift
//  RaptureReady
//
//  Created by anca dev on 18/06/24.
//

import Foundation
import UIKit

extension UICollectionView {
    
    public func makeGroup() {
        self.collectionViewLayout = viewLayout()
    }
    
    private func viewLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize:  NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(0.5)
            ), subitem: item, count: 2
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}
