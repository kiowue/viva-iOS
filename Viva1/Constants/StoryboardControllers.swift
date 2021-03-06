//
//  Constants.storyboards.swift
//  Viva
//
//  Created by vishwender on 1/22/18.
//  Copyright © 2018 viva. All rights reserved.
//
// This file is autogenerated, do not edit here

import Foundation
import UIKit

enum Storyboard : String {
    case collection = "Collection"
    case settings = "Settings"
    case home = "Home"
    case itemCategories = "ItemCategories"
    case itemsDetailViewController = "ItemsDetailViewController"
    case launchScreen = "LaunchScreen"
    case main = "Main"

    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

enum StoryboardViewController: String {
    case collectionViewController = "CollectionViewController"
    case collectionNavigationController = "CollectionNavigationController"
    case settingsViewController = "SettingsViewController"
    case settingsViewNavigationController = "SettingsViewNavigationController"
    case homeViewController = "HomeViewController"
    case homeNavigationController = "HomeNavigationController"
    case itemCategoriesViewController = "ItemCategoriesViewController"
    case itemCategoriesNavigationController = "ItemCategoriesNavigationController"
    case itemsDetailViewController = "ItemsDetailViewController"
    var storyboard: Storyboard {
        switch self {
        case .collectionViewController:
            return .collection
        case .collectionNavigationController:
            return .collection
        case .settingsViewController:
            return .settings
        case .settingsViewNavigationController:
            return .settings
        case .homeViewController:
            return .home
        case .homeNavigationController:
            return .home
        case .itemCategoriesViewController:
            return .itemCategories
        case .itemCategoriesNavigationController:
            return .itemCategories
        case .itemsDetailViewController:
            return .itemsDetailViewController
        }
    }

    var instance: UIViewController {
        return self.storyboard.instance.instantiateViewController(withIdentifier: self.rawValue)
    }
}
