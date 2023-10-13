//
//  PSPayCouponState.swift
//  HipotecarioApp
//
//  Created by Juan Pablo Ziegler on 09/09/2020.
//  Copyright © 2020 Hipotecario. All rights reserved.
//

import Foundation
import Networking
import UIKit
import Utils

final class PSPayCouponState: MBDeepLinkState {
    
    private var flowCoordinator: PSOnboardingFlowCoordinator?
    let message = "PSCollectMoneyView_loading_message".localized()
    
    func showView(_ params: MBParameters) {
        guard let viewController = self.currentViewController, let couponId = params["id"] as? String else {
            return
        }
        MBLoadingIndicatorView.sharedInstance.showLoading(message)
        viewController.tabBarController?.tabBar.isHidden = true
        flowCoordinator = PSOnboardingFlowCoordinator(navigationController: viewController.navigationController ?? UINavigationController(), dependencies: MBDependenciesLocator())
        flowCoordinator?.start(type: .sendMoney(couponId))
    }
}
