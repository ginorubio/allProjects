//
//  PushNotificationPayWithPointsState.swift
//  HipotecarioApp
//
//  Created by Castillo Alejandro on 09/03/2023.
//  Copyright © 2023 Hipotecario. All rights reserved.
//

import Foundation
import Core

final class PushNotificationPayWithPointsState: PushNotificationStateProtocol {
    func showView(with notification: PushNotificationModel, isStoredNotification: Bool?) {
        if isStoredNotification ?? false {
            NotificationCenter.default.post(MBConstant.pushNotificationPayWithPoints)
        } else {
            let pwpOfferNotificationVC = PayWithPointsPushNotificationViewController(notification: notification)
            let context = UIApplication.getTopViewController()

            pwpOfferNotificationVC.modalPresentationStyle = .overCurrentContext
            pwpOfferNotificationVC.modalTransitionStyle = .crossDissolve

            context?.present(pwpOfferNotificationVC, animated: true)
        }
    }
}
