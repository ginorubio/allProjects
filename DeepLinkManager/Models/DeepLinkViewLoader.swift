//
//  DeepLinkViewLoader.swift
//  HipotecarioApp
//
//  Created by Juan Pablo Ziegler on 09/09/2020.
//  Copyright © 2020 Hipotecario. All rights reserved.
//

import Foundation
import Utils

class DeepLinkViewLoader {
    internal var viewController: UIViewController?
    
    var currentViewController: UIViewController? {
        return self.viewController?.topMostViewController()
    }
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
}
