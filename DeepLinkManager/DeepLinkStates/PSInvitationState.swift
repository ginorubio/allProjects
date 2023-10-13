//
//  PSInvitationState.swift
//  HipotecarioApp
//
//  Created by Franklin Cárdenas on 30/09/2020.
//  Copyright © 2020 Hipotecario. All rights reserved.
//

import Foundation
import Networking

final class PSInvitationState: MBDeepLinkState {

    private var flowCoordinator: PSOnboardingFlowCoordinator?

    func showView(_ params: MBParameters) {
        guard let viewController = currentViewController else {
            return
        }

        viewController.tabBarController?.tabBar.isHidden = true
        flowCoordinator = PSOnboardingFlowCoordinator(
            navigationController: viewController.navigationController ?? UINavigationController(),
            dependencies: MBDependenciesLocator()
        )
        flowCoordinator?.showOnboardingView()
    }
}
