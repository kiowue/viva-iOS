//
//  ItemCategoriesViewInterface.swift
//  Viva1
//
//  Created by vishwender on 8/20/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit

class ItemCategoriesViewInterface: ViewInterfaceProtocol {
    func presentDetailScreen<T>(from view: UIViewController, forPost post: T) {
        let detalViewController = StoryboardViewController.itemsDetailViewController.instance as! ItemsDetailViewController
        view.present(detalViewController, animated: true, completion: nil)
    }
    
}
