//
//  StoredDeepLink.swift
//  HipotecarioApp
//
//  Created by Juan Pablo Ziegler on 09/09/2020.
//  Copyright © 2020 Hipotecario. All rights reserved.
//

import Foundation
import Networking

struct StoredDeepLink {
    var params: MBParameters
    var state: MBDeepLinkStateProtocol
}
