//
//  BaseUIViewController.swift
//  Viva1
//
//  Created by vishwender on 8/21/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit

class BaseUIViewController: UIViewController, ViewControllerProtocol {
    var presenter: ViewPresenterProtocol?
    
    func showPosts<T>(with posts: [T]) {
        //
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
