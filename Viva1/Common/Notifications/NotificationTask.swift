//
//  NotificationTask.swift
//  Viva1
//
//  Created by vishwender on 9/9/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class NotificationTask: NSObject {
    
    static let sharedInstance = NotificationTask()
    
    func registerNewNotification(application:UIApplication) {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        application.registerForRemoteNotifications()
        center.requestAuthorization(options: options, completionHandler: { (authorized, error) in
            if authorized {
//                let categoryIdCms = Constants.pushNotification.cmsCategoryIdentifier
//                let categoryIdMoengage = Constants.pushNotification.moengageCategoryIdentifier
//                //empty initialization of actions , intentIdentifiers and options field and they are not needed now can be changed in future according to the requirement
//                let categoryCms = UNNotificationCategory(identifier: categoryIdCms, actions: [], intentIdentifiers: [], options: [])
//                let categoryMoengage = UNNotificationCategory(identifier: categoryIdMoengage, actions: [], intentIdentifiers: [], options: [])
//                center.setNotificationCategories([categoryCms,categoryMoengage])
            }
        })
    }
}

extension NotificationTask: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        //
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        //
    }
}
