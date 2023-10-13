//
//  PushNotificationContract.swift
//  HipotecarioApp
//
//  Created by Castillo Alejandro on 09/03/2023.
//  Copyright © 2023 Hipotecario. All rights reserved.
//

import Foundation

protocol PushNotificationManagerProtocol {
    func loadPushNotification(with notification: [AnyHashable: Any])
}

protocol PushNotificationStateProtocol {
    func showView(with notification: PushNotificationModel, isStoredNotification: Bool?)
}
