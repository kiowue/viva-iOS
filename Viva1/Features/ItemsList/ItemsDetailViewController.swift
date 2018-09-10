//
//  ItemsDetailViewController.swift
//  Viva1
//
//  Created by vishwender on 9/5/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit

class ItemsDetailViewController: BaseUITableViewController {
    
    struct constants {
        static let identifierPurchaseItemTableViewCell = "PurchaseItemTableViewCell"
    }
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: PurchaseItemTableViewCell.constants.nibName, bundle: Bundle.main), forCellReuseIdentifier: constants.identifierPurchaseItemTableViewCell)
        presenter = HomeViewPresenter(view: self)
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK:- UITableViewControllerDelegate/UITableViewControllerDataSourceelegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: constants.identifierPurchaseItemTableViewCell) as! PurchaseItemTableViewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
