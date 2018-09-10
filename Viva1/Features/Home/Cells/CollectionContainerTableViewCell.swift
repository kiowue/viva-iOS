//
//  CollectionContainerTableViewCell.swift
//  Viva1
//
//  Created by vishwender on 8/19/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit

class CollectionContainerTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
}

//extension CollectionContainerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return searches.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView,
//                                 numberOfItemsInSection section: Int) -> Int {
//        return searches[section].searchResults.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView,
//                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
//                                                      for: indexPath) as! CollectionFlickrCell
//        let flickrPhoto = photoForIndexPath(indexPath: indexPath)
//        cell.backgroundColor = UIColor.white
//        cell.imageView.image = flickrPhoto.thumbnail
//        return cell
//    }
//}
