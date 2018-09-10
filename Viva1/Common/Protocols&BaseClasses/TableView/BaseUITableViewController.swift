//
//  BaseUITableViewController.swift
//  Viva1
//
//  Created by vishwender on 8/21/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit

class BaseUITableViewController: UITableViewController, ViewControllerProtocol {
    var presenter: ViewPresenterProtocol?
    var contentOrderedSet = NSMutableOrderedSet()
    
    func showPosts<T>(with posts: [T]) {
        contentOrderedSet = NSMutableOrderedSet(array: posts)
        tableView.reloadData()
    }
    
    func showError() {
        //
    }
    
    func showLoading() {
        //
    }
    
    func hideLoading() {
        //
    }
}
