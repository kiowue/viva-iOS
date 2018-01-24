//
//  HomeViewInterface.swift
//  Viva1
//
//  Created by vishwender on 1/18/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit

struct HomeViewInterface {
    static func getNavigationController() -> UINavigationController? {
        let homeNavigation = StoryboardViewController.homeNavigationController.instance as? UINavigationController
        return homeNavigation
    }
    
    static func getViewControllerInstance() -> UIViewController? {
        let homeVC = StoryboardViewController.homeViewController.instance
        return homeVC
    }
}
