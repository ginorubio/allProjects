//
//  PushNotificationModel.swift
//  HipotecarioApp
//
//  Created by Castillo Alejandro on 09/03/2023.
//  Copyright © 2023 Hipotecario. All rights reserved.
//

import Foundation

final class PushNotificationModel {
    var state: PushNotificationStateProtocol?
    var type: String?
    var title: String?
    var body: String?
    var url: String?
    var onboardingFlow: String?
    var imageURL: String?
    
    init(userInfoDict: [AnyHashable: Any], state: PushNotificationStateProtocol? = nil) {
        let aps = userInfoDict[AnyHashable("aps")] as? NSDictionary
        let alert = aps?["alert"] as? NSDictionary
        let title = alert?["title"] as? String
        let body = alert?["body"] as? String
        let type = userInfoDict["type"] as? String
        let url = userInfoDict[AnyHashable("PushExternalLink")] as? String
        let onboardingFlow = userInfoDict[AnyHashable("OnboardingFlow")] as? String
        let imageURL = userInfoDict[AnyHashable("ImageToShow")] as? String
        
        self.state = state
        self.title = title
        self.body = body
        self.type = type
        self.url = url
        self.onboardingFlow = onboardingFlow
        self.imageURL = imageURL
    }
}
