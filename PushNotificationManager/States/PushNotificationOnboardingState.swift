//
//  PushNotificationOnboardingState.swift
//  HipotecarioApp
//
//  Created by Castillo Alejandro on 09/03/2023.
//  Copyright © 2023 Hipotecario. All rights reserved.
//

import Foundation

final class PushNotificationOnboardingState: PushNotificationStateProtocol {
    func showView(with notification: PushNotificationModel, isStoredNotification: Bool?) {
        guard let url = notification.url,
        !url.isEmpty else {
            let storyboard = UIStoryboard(name: "MBEnviromentSelector", bundle: nil)
            let viewController: UIViewController = storyboard.instantiateInitialViewController()!
            UIApplication.shared.keyWindow?.rootViewController = viewController
            UIApplication.shared.keyWindow?.makeKeyAndVisible()
            return
        }
        
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url)
    }
}
