//
//  PushNotificationStates.swift
//  HipotecarioApp
//
//  Created by Castillo Alejandro on 09/03/2023.
//  Copyright © 2023 Hipotecario. All rights reserved.
//

import Foundation

final class PushNotificationStates {
    static let sharedInstance = PushNotificationStates()
    private var userSession: MBUserSessionHandlerProtocol
    var states: [PushNotificationType: PushNotificationStateProtocol]? = [:]
    
    init(userSession: MBUserSessionHandlerProtocol = MBUserSessionHandler.sharedInstance) {
        self.userSession = userSession
        self.createStates()
    }
    
    private func createStates() {
        states?[.payWithPoints] = PushNotificationPayWithPointsState()
        states?[.discounts] = PushNotificationDiscountState(userSession: userSession)
        states?[.onboarding] = PushNotificationOnboardingState()
    }
}
