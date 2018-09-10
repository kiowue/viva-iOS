//
//  HomeViewInterface.swift
//  Viva1
//
//  Created by vishwender on 1/18/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit

class HomeViewInterface: ViewInterfaceProtocol {
    func presentDetailScreen<T>(from view: UIViewController, forPost post: T) {
        //
    }
    
    
    private static var homeVC : UIViewController?
    private static var homeNavigation : UINavigationController?
    
    static func getNavigationController() -> UINavigationController? {
        if homeNavigation == nil {
            homeNavigation = StoryboardViewController.homeNavigationController.instance as? UINavigationController
        }
        
        return homeNavigation
    }
    
    static func getViewControllerInstance() -> UIViewController? {
        if homeVC == nil {
            homeVC = getHomeViewControllerInstance()
        }
        return homeVC
    }
    
    static func getHomeViewControllerInstance() -> UIViewController? {
        if let nav = getNavigationController() {
            homeNavigation = nav
            homeVC = nav.viewControllers.first
        }
        return homeVC
    }
}
