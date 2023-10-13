//
//  PushNotificationDiscountState.swift
//  HipotecarioApp
//
//  Created by Castillo Alejandro on 09/03/2023.
//  Copyright © 2023 Hipotecario. All rights reserved.
//

import Foundation
import Utils

final class PushNotificationDiscountState: PushNotificationStateProtocol {
    private var discountsViewModel: MBDiscountViewModelProtocol?
    private var userSession: MBUserSessionHandlerProtocol
    
    init(userSession: MBUserSessionHandlerProtocol = MBUserSessionHandler.sharedInstance) {
        self.userSession = userSession
    }
    
    func showView(with notification: PushNotificationModel, isStoredNotification: Bool?) {
        if userSession.isLoggedIn() {
            discountsNotificationForLoggedInUser()
        } else {
            discountsNotificationForLoggedOutUser()
        }
    }
    
    private func discountsNotificationForLoggedInUser() {
        guard let context = UIApplication.rootViewController?.topMostViewController() else { return }
        let discountsViewModel = MBDiscountViewModel(service: MBDiscountService(),
                                                     request: MBDiscountRequest(),
                                                     getUrlFromDiscountMessageUseCase: MBGetURLFromMessageUseCase(),
                                                     view: context)
        
        self.discountsViewModel = discountsViewModel
        self.discountsViewModel?.showDiscountNotificationMessage(view: context)
    }
    
    private func discountsNotificationForLoggedOutUser() {
        guard (UIApplication.rootViewController?.topMostViewController() as? LoginViewController) == nil,
              let window = UIApplication.shared.keyWindow else {
            navigateToDiscounts()
            return
        }
        
        let loginStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let loginVC = loginStoryboard.instantiateViewController(withIdentifier: "LoginID")
        
        let navController = UINavigationController(rootViewController: loginVC)
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        window.rootViewController = navController
        
        let options = UIView.AnimationOptions.transitionCrossDissolve
        let duration = 0.35
        
        UIView.transition(with: window,
                          duration: duration,
                          options: options,
                          animations: {},
                          completion: { [weak self] _ in
            self?.navigateToDiscounts()
        })
    }
    
    private func navigateToDiscounts() {
        let discountsStoryboard = UIStoryboard(name: "DiscountsStoryboard", bundle: nil)
        
        guard let discountsVC = discountsStoryboard.instantiateViewController(withIdentifier: "DiscountsStoryboardID") as? MBDiscountsViewController else { return }
        
        let discountsViewModel = MBDiscountViewModel(service: MBDiscountService(),
                                                     request: MBDiscountRequest(),
                                                     getUrlFromDiscountMessageUseCase: MBGetURLFromMessageUseCase(),
                                                     view: discountsVC)
        discountsVC.viewModel = discountsViewModel
        
        let contextVC = UIApplication.rootViewController?.topMostViewController()
        contextVC?.navigationController?.pushViewController(discountsVC, animated: true)
    }
}
