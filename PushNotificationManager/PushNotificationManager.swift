//
//  PushNotificationManager.swift
//  HipotecarioApp
//
//  Created by Castillo Alejandro on 09/03/2023.
//  Copyright © 2023 Hipotecario. All rights reserved.
//

import Foundation
import Core

enum PushNotificationType: String {
    case payWithPoints = "PayWithPoints"
    case discounts = "Discounts"
    case onboarding = "Onboarding"
}

final class PushNotificationManager {
    private var userSession: MBUserSessionHandlerProtocol
    private var handler: [PushNotificationType: PushNotificationStateProtocol]?
    private var storedNotification: PushNotificationModel?
    
    init(userSession: MBUserSessionHandlerProtocol = MBUserSessionHandler.sharedInstance,
         handler: [PushNotificationType: PushNotificationStateProtocol]? = PushNotificationStates.sharedInstance.states) {
        self.userSession = userSession
        self.handler = handler
    }
    
    private func saveNotification(_ notification: PushNotificationModel) {
        MBNotification.isANotification = true
        MBNotification.closedNotification = true
        MBNotification.notificationTitle = notification.title ?? ""
        MBNotification.notificationMessage = notification.body ?? ""
        MBNotification.imageURL = notification.imageURL ?? ""
        MBNotification.url = notification.url ?? ""
    }
    
    @objc private func consolidatedWasLoaded() {
        NotificationCenter.default.removeObserver(self,
                                                  name: MBConstant.pushNotificationFromLogout.name,
                                                  object: nil)
        guard let storedNotification = storedNotification else { return }
        storedNotification.state?.showView(with: storedNotification, isStoredNotification: true)
    }
}

extension PushNotificationManager: PushNotificationManagerProtocol {
    func loadPushNotification(with notification: [AnyHashable: Any]) {
        let notification = PushNotificationModel(userInfoDict: notification)
        
        switch notification.type {
        case PushNotificationType.payWithPoints.rawValue:
            guard let notificationEnumType = PushNotificationType(rawValue: notification.type ?? ""),
                  let handler = handler?[notificationEnumType] else { return }
            
            guard userSession.isLoggedIn() else {
                NotificationCenter.default.addObserver(self,
                                                       selector: #selector(consolidatedWasLoaded),
                                                       name: MBConstant.pushNotificationFromLogout.name,
                                                       object: nil)
                handler.showView(with: notification, isStoredNotification: false)
                storedNotification = notification
                storedNotification?.state = handler
                return
            }
            
            handler.showView(with: notification, isStoredNotification: false)
            
        default:
            notificationHandlerForNoTypeSpecified(for: notification)
        }
    }
    
    //TODO: Add the type of notification to receive
    private func notificationHandlerForNoTypeSpecified(for notification: PushNotificationModel) {
        if notification.onboardingFlow == "true" {
            //MARK: OnboardingFlow
            handler?[.onboarding]?.showView(with: notification, isStoredNotification: false)
        } else if (notification.type != "Login"){
            //MARK: DiscountFlow
            saveNotification(notification)
            handler?[.discounts]?.showView(with: notification, isStoredNotification: false)
        }
    }
}
