//
//  AppDelegateFireBase.swift
//  OPOS
//
//  Created by Nguyễn Quang on 10/9/20.
//  Copyright © 2020 eglifevn. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseMessaging
import UserNotifications

@available(iOS 11.0, *)
extension AppMainData: UNUserNotificationCenterDelegate {
    
    public func initFCM(application: UIApplication,
                        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        FirebaseApp.configure()
        UNUserNotificationCenter.current().delegate = self
        Messaging.messaging().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions,
                                                                completionHandler: {_, _ in })
        application.registerForRemoteNotifications()
    }
    
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("register notification fail")
        print(error)
    }
    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        if (application.applicationState == UIApplication.State.inactive || application.applicationState == UIApplication.State.active) {
            print("Firebase Receive remote message = \(userInfo)")
        }
    }
    
    func application(_ application: UIApplication,
                     handleActionWithIdentifier identifier: String?,
                     forRemoteNotification userInfo: [AnyHashable: Any],
                     withResponseInfo responseInfo: [AnyHashable: Any],
                     completionHandler: @escaping () -> Void) {
        
    }
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
    
}
@available(iOS 11.0, *)
extension AppMainData {
    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print(userInfo)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}

@available(iOS 11.0, *)
extension AppMainData: MessagingDelegate {
    // [START refresh_token]
    private func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
        // TO DO
        print("Firebase refresh registration token: \(fcmToken)")
        delegate?.refreshRegistrationToken(fcmToken: fcmToken)
        
    }
    
    private func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        // TO DO
        print("Firebase received registration token: \(fcmToken ?? "")")
        delegate?.receivedRegistrationToken(fcmToken: fcmToken)
    }
}
