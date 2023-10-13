//
//  MBDeepLinkManager.swift
//  HipotecarioApp
//
//  Created by Juan Pablo Ziegler on 08/09/2020.
//  Copyright © 2020 Hipotecario. All rights reserved.
//

import Foundation
import Networking
import Core
import UIKit

enum MBDeepLink: String {
    case payCoupon = "/pago-hipotecario"
    case register = "/registro-hipotecario"
    case dummy
}

protocol MBDeepLinkManagerProtocol {
    func loadDeepLink(from path: String, parameters: [URLQueryItem]?) -> Bool
}

typealias MBDeepLinkState = MBDeepLinkStateProtocol & DeepLinkViewLoader

final class MBDeepLinkManager {
    var handler: [MBDeepLink: MBDeepLinkStateProtocol]
    var stateToShow: StoredDeepLink?
    var userSession: MBUserSessionHandlerProtocol
    
    init(handler: [MBDeepLink: MBDeepLinkStateProtocol] = [:], viewController: UIViewController?, userSession: MBUserSessionHandlerProtocol = MBUserSessionHandler.sharedInstance) {
        self.handler = handler
        self.userSession = userSession
        createHandler(viewController)
    }
    
    private func createHandler(_ viewController: UIViewController?) {
        handler[.dummy] = MBDummyState(viewController: viewController)
        handler[.payCoupon] = PSPayCouponState(viewController: viewController)
        handler[.register] = PSInvitationState(viewController: viewController)
    }
    
    @objc private func consolidatedWasLoaded(_ sender: Any) {
        NotificationCenter.default.removeObserver(self, name: MBConstant.MB_CONSOLIDATED_LOADED_NOTIFICATION.name, object: nil)
        guard let stateToShow = self.stateToShow else {
            return
        }
        stateToShow.state.showView(stateToShow.params)
    }
}

extension MBDeepLinkManager: MBDeepLinkManagerProtocol {
    func loadDeepLink(from path: String, parameters: [URLQueryItem]?) -> Bool {
        var params = MBParameters()
        parameters?.forEach {
            params[$0.name] = $0.value
        }
        guard let deepLink = MBDeepLink(rawValue: path),
            let state = handler[deepLink] else {
            return false
        }
        guard userSession.isLoggedIn() else {
            stateToShow = StoredDeepLink(params: params, state: state)
            
            NotificationCenter.default.addObserver(self, selector: #selector(consolidatedWasLoaded(_:)), name: MBConstant.MB_CONSOLIDATED_LOADED_NOTIFICATION.name, object: nil)
            return true
        }
        state.showView(params)
        return true
    }
}
