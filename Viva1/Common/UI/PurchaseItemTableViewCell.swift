//
//  PurchaseItemTableViewCell.swift
//  Viva1
//
//  Created by vishwender on 8/21/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class PurchaseItemTableViewCell: UITableViewCell {
    
    struct constants {
        static let nibName = "PurchaseItemTableViewCell"
    }
    
    @IBOutlet weak var itemThumbnail: UIImageView!
    @IBOutlet weak var addSubtractView: UIView!
    
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var mrp: UILabel!
    @IBOutlet weak var priceAfterDiscount: UILabel!
    
    @IBOutlet weak var quantityOptionsView: UIView!
    @IBOutlet weak var quantityOptionsLabel: UILabel!
    @IBOutlet weak var quantityOptionsDownArrowImage: UIImageView!
    
    var purchaseItem: PurchaseItemType?
    
    func configure(withItem purchaseItem: PurchaseItemType) {
        self.purchaseItem = purchaseItem
        brandName.text = purchaseItem.brandName
        title.text = purchaseItem.name
        let itemSelectedIndex = purchaseItem.quantityDescriptionSelectedIndex
        if let items = purchaseItem.quantityDescriptionArray {
            if items.count > itemSelectedIndex {
                let item = items[Int(itemSelectedIndex)]
                mrp.text = "MRP: Rs \(item.mrp)"
                if item.mrp != item.priceAfterDiscount {
                    let priceAfterDisc = item.priceAfterDiscount ?? item.mrp
                    priceAfterDiscount.text = "Rs \(priceAfterDisc)"
                }
                
                quantityOptionsLabel.text = "\(item.quantity) \(item.unit)"
            } else if items.count > 0 {
                let item = items[0]
                if item.mrp != item.priceAfterDiscount {
                    let priceAfterDisc = item.priceAfterDiscount ?? item.mrp
                    priceAfterDiscount.text = "Rs \(priceAfterDisc)"
                }
                mrp.text = "MRP: Rs \(item.mrp)"
                
                quantityOptionsLabel.text = "\(item.quantity) \(item.unit)"
            }
            
            if items.count > 1 {
                quantityOptionsView.layer.cornerRadius = Constants.normalCornerRadius
                quantityOptionsView.layer.borderWidth = 1.0
                quantityOptionsDownArrowImage.isHidden = false
            } else {
                quantityOptionsView.layer.borderWidth = 0
                quantityOptionsDownArrowImage.isHidden = true
            }
            
            addSubtractView.isHidden = false
            let view = AddSubtractButtonView.getView(frame: addSubtractView.frame)
            view.viewDelegate = self
            addSubtractView.addSubview(view)
            addSubtractView.clipsToBounds = true
        } else {
            addSubtractView.isHidden = true
        }
        if let urlString = purchaseItem.image, let url = URL(string: urlString) {
            itemThumbnail.kf.setImage(with: url)
        }
    }
}

extension PurchaseItemTableViewCell: AddSubtractButtonViewDelegate {
    func subtractButtonTapped() {
        guard let purchaseItem = purchaseItem else {return}
        if purchaseItem.quantitySelected == 0 {return}
        self.purchaseItem?.quantitySelected -= 1
    }
    
    func addButtonTapped() {
        guard let purchaseItem = purchaseItem else {return}
        if purchaseItem.quantitySelected == PurchaseItemType.Constants.maxSelectCountLimit {return}
        self.purchaseItem?.quantitySelected += 1
    }
}
