//
//  AppMainProtocol.swift
//  NQNotification
//
//  Created by Nguyen Quang on 06/08/2022.
//

import Foundation

public protocol NotificationSettingsProvider {
    /// Firebase refresh registration token:
    /// - Parameter fcmToken: get fcm token
    func refreshRegistrationToken(fcmToken: String)
    /// Firebase received registration token:
    /// - Parameter fcmToken: get fcm token
    func receivedRegistrationToken(fcmToken: String?)
}

public class AppMainData: NSObject {
    public static let shared = AppMainData()
    public var delegate: NotificationSettingsProvider?
}
