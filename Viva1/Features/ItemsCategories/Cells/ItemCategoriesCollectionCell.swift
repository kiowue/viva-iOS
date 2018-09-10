//
//  ItemCategoriesCollectionCell.swift
//  Viva1
//
//  Created by vishwender on 8/24/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit

class ItemCategoriesCollectionCell: UICollectionViewCell {
    @IBOutlet weak var itemLabelName: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    func configure(itemName: String, image: String?) {
        self.itemLabelName.text = itemName
        if let imageUrlString = image, let url = URL(string: imageUrlString) {
            thumbnail.kf.setImage(with: url)
        }
    }
}
