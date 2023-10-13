//
//  MBDummyState.swift
//  HipotecarioApp
//
//  Created by Juan Pablo Ziegler on 09/09/2020.
//  Copyright © 2020 Hipotecario. All rights reserved.
//

import Foundation
import Networking
final class MBDummyState: MBDeepLinkState {
    
    func showView(_ params: MBParameters) {
        guard let viewController = self.currentViewController,
        let message1 = params["message1"], let message2 = params["message2"] as? String else {
            return
        }
        viewController.showSimpleAlert(title: "Parametros", message: "\(message1)\n \(message2)", complete: {
        })
    }
}
