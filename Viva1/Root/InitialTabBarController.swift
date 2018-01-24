//
//  InitialTabBarController.swift
//  Viva1
//
//  Created by vishwender on 1/17/18.
//  Copyright © 2018 viva. All rights reserved.
//

import UIKit

class InitialTabBarController {
    static let sharedManager : InitialTabBarController = InitialTabBarController()
    
    fileprivate struct constants {
        struct tabBarIndex {
            static let home = 0
            static let radio = 1
            static let player = 2
            static let myMusic = 3
            static let settings = 4
        }
    }
    
    var tabController : UITabBarController?
    var homeNavigation : UINavigationController?
    var radioNavigation : UINavigationController?
    var playerNavigation : UINavigationController?
    var myMusicNavigation : UINavigationController?
    var settingNavigation : UINavigationController?
    
    func setupTabBarController(index: Int) {
//        guard !isIpad else {
//            InitialTabBarController_iPad.sharedInstance.setup(index: index)
//            return
//        }
        
        addObservers()
        tabController = UITabBarController()

        homeNavigation = HomeViewInterface.getNavigationController()
        homeNavigation?.title = "Home"

//        settingNavigation = SettingViewController.getNavigationController()
//        settingNavigation!.title = "Settings"
//
//        if tabController != nil {
//            tabController!.delegate = self
//            let controllers: [UIViewController] = [homeNavigation!, radioNavigation!, playerNavigation!, myMusicNavigation!, settingNavigation!]
//            tabController!.viewControllers = controllers
//            tabController!.selectedViewController = controllers[index]
//            APP_DELEGATE.window = UIWindow.init(frame: UIScreen.main.bounds)
//            APP_DELEGATE.window.backgroundColor = UIColor.white
//            setRootViewController(onboardingViewController: tabController!)
//            setTabBarItemImage()
//        }
    }

    func addObservers() {
//        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: ABTestingTask.constants.notification), object: nil, queue: nil) {[weak self](notification) -> Void in
//        }
    }

    func setRootViewController(onboardingViewController: UIViewController) {
//        if APP_DELEGATE.window == nil {
//            APP_DELEGATE.window = UIWindow.init(frame: UIScreen.main.bounds)
//        }
//        APP_DELEGATE.window.rootViewController = onboardingViewController;
//        APP_DELEGATE.window.makeKeyAndVisible()
    }

    func destroyInitialTab() {
//        guard !isIpad else {
//            InitialTabBarController_iPad.sharedInstance.destroyInitialTab()
//            return
//        }

        homeNavigation = nil
        radioNavigation = nil
        playerNavigation = nil
        myMusicNavigation = nil
        settingNavigation = nil
        tabController = nil
    }


    func setTabBarItemImage() {
        guard let tTabController = tabController else {
            return
        }

        if let tabBarItems = tTabController.tabBar.items {

            if tabBarItems.count > constants.tabBarIndex.home {
                let homeItem = tabBarItems[constants.tabBarIndex.home]
                homeItem.image = UIImage(named: "ic_home_unselected")
                homeItem.selectedImage = UIImage(named: "ic_home_selected")
            }

            if tabBarItems.count > constants.tabBarIndex.radio {
                let radioItem = tabBarItems[constants.tabBarIndex.radio]
                radioItem.image = UIImage(named: "ic_radio_unselected")
                radioItem.selectedImage = UIImage(named: "ic_radio_selected")
            }

            if tabBarItems.count > constants.tabBarIndex.player {
                let playerItem = tabBarItems[constants.tabBarIndex.player]
                playerItem.image = UIImage(named: "ic_player_unselected")
                playerItem.selectedImage = UIImage(named: "ic_player_selected")
            }

            if tabBarItems.count > constants.tabBarIndex.myMusic {
                let myMusicItem = tabBarItems[constants.tabBarIndex.myMusic]
                myMusicItem.image = UIImage(named: "ic_mymusic_unselected")
                myMusicItem.selectedImage = UIImage(named: "ic_mymusic_selected")
            }

            if tabBarItems.count > constants.tabBarIndex.settings {
                let settingItem = tabBarItems[constants.tabBarIndex.settings]
                settingItem.image = UIImage(named: "ic_settings_unselected")
                settingItem.selectedImage = UIImage(named: "ic_settings_selected")
            }
        }

        //tab bar controller color
//        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : Constants.colors.redColor!], for: .selected)
//        tabController!.tabBar.tintColor = Constants.colors.redColor
    }
}

//MARK: - UITabBarControllerDelegate
//extension InitialTabBarController: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

//        if (viewController is UINavigationController) {
//            var isNavigatingFromHome: Bool = false
//            let VC = viewController as! UINavigationController
//
//            let selectedViewController = tabBarController.selectedViewController
//            let currentViewController = (selectedViewController as? UINavigationController)?.viewControllers.last
//
//            if currentViewController != nil {
//                if (currentViewController! is LanguageSelectionController) {
//                    (selectedViewController as! UINavigationController).popViewController(animated: false)
//                }
//                else if (currentViewController! is HomeViewController) {
//                    isNavigatingFromHome = true
//                }
//            }
//
//            if let destinationViewController = VC.viewControllers.first, currentViewController != nil {
//                var linkID : String?
//                if (destinationViewController is HomeViewController) {
//                    linkID = HOME_TRACKING_ID
//                }
//                else if (destinationViewController is RadioGridViewController) {
//                    linkID = RADIO_TRACKING_ID
//                }
//                else if (destinationViewController is UIPlayerController) {
//                    linkID = PLAYER_TRACKING_ID
//                }
//                else if (destinationViewController is MyMusicController) {
//                    linkID = MY_MUSIC_TRACKING_ID
//                }
//                else if (destinationViewController is PreferencePaneViewController) {
//                    linkID = SETTINGS_TRACKING_ID
//                }
//
//                if linkID != nil {
//                    APP_DELEGATE.navigationTrackingPending = [LINK_ID: linkID!, "module_id": MODULE_ID_NAVIAGTION]
//                }
//            }
//
//            //Hack for player controller
//            if let destinationViewController = VC.viewControllers.first {
//                if (destinationViewController is DummyPlayerNavigationController) {
//                    if isNavigatingFromHome && currentViewController is HomeViewController {
//                        let vc = currentViewController as! HomeViewController
//                        MoEngageOperation.moEngageInAppHandleOperation?.cancel()
//                        vc.carouselCell?.stopCarouselAutoScroll()
//                    }
//                    UIPlayerControllerInterface.showPlayer()
//                    return false
//                }
//            }
//
//            UserStateManager.sharedManager.trySyncDataCall()
//            ConfigAPITask.tryCallingAPI()
//            WidgetTask.sharedTask.setDataForWidget()
//            WidgetTask.sharedTask.setAppAsActive()
//        }
//        return true
//    }

//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        APP_DELEGATE.checkConnectivity(for: nil)
//        BSBFreshDesk.presentUnreadNotification(viewController)
//    }
//}

