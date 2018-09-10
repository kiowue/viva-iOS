//
//  FirebaseTask.swift
//  Viva1
//
//  Created by vishwender on 9/8/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import Firebase
import FirebaseUI
import GoogleSignIn

class FirebaseTask: NSObject {
    
    static let sharedInstance = FirebaseTask()
    var authUI : FUIAuth?
    var authViewController : UINavigationController?
    var fcmToken : String?
//    var instanceIDTokenString: String?
    
    //This is to be called before app finishes launching
    // Call this method in applicationWillFinishLaunching: or applicationDidFinishLaunching: method
    func configureFirebase() {
        FirebaseApp.configure()
        
        configureAuthUI()
        configureFirebaseMessages()
    }
    
    func configureAuthUI() {
        self.authUI = FUIAuth.defaultAuthUI()
        guard let authUI = self.authUI else {
            return
        }
        
        // Adopt a FUIAuthDelegate protocol to receive callback
        authUI.delegate = self
        
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth(),
            FUIPhoneAuth(authUI:authUI),
            ]
        authUI.providers = providers
        
        authViewController = authUI.authViewController()
    }
    
    func configureFirebaseMessages() {
        Messaging.messaging().delegate = self
    }
    
//    func getFirebaseMessageTokenString() {
//        InstanceID.instanceID().instanceID {[weak self](result, error)->Void in
//            if let error = error {
//                print("Error fetching remote instange ID: \(error)")
//            } else if let result = result {
//                print("Remote instance ID token: \(result.token)")
//                self?.instanceIDTokenString  = result.token
//            }
//        }
//    }
}

extension FirebaseTask: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        //
    }
}

extension FirebaseTask: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        self.fcmToken = fcmToken
    }
    
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        //
    }
}
