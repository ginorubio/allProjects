//
//  MBCrashlytics.swift
//  HipotecarioApp
//
//  Created by Agustinch on 01/10/2022.
//  Copyright © 2022 Hipotecario. All rights reserved.
//

import Foundation
import FirebaseCrashlytics

protocol MBCrashlyticsProtocol {
    func logEventCrashlytics(name: MBEventCrashlytics, error: NSError )
    func addUserId(id: String)
}

final class MBCrashlytics: MBCrashlyticsProtocol {
    static var instance = MBCrashlytics()

    func logEventCrashlytics(name: MBEventCrashlytics, error: NSError ){
        Crashlytics.crashlytics().record(error: error)
    }
    
    func addUserId(id: String) {
        Crashlytics.crashlytics().setUserID(id)
    }
}


enum MBEventCrashlytics: String {
    
    //Register Onboarding
    case onboardRegister = "onboard_init_register_error_sv"
    
    //Front DNI
    case onboardFrontDNISystem = "onboard_photo_error_system_front_dni"
    case onboardFrontDNIServer = "onboard_photo_error_sv_front_dni"
    
    //Front DNI Retry
    case onboardFrontDNISystemRetry = "onboard_photo_error_system_front_rt"
    case onboardFrontDNIServerRetry = "onboard_photo_error_service_front_rt"
    
    //Back DNI
    case onboardBackDNISystem = "onboard_photo_error_system_back_dni"
    case onboardBackDNIServer = "onboard_photo_error_sv_back_dni"
    
    //dni BarCode Save
    
    case onboardDniBarCodeSave = "onboard_error_sv_barcode_dni"
    case onboardDniBarCodeSaveRetry = "onboard_error_sv_barcode_dni_rt"

    //Back DNI Retry
    case onboardBackDNISystemRetry = "onboard_photo_error_system_back_rt"
    case onboardBackDNIServerRetry = "onboard_photo_error_service_back_rt"
    
    //Take Selfie
    case onboardTakeSelfie = "onboard_photo_error_system_take_selfie"
    
    //Max Retry
    case onboardMaxRetry = "onboard_close_app_max_retries"

    //Take Selfie Register
    case onboardRegisterTakeSelfie = "onboard_register_error_sv"
    case onboardEndOperationTakeSelfie = "onboard_end_operation_error_sv"
    
    case onboardRegisterTakeSelfieRetry = "onboard_register_error_sv_rt"
    case onboardEndOperationTakeSelfieRetry = "onboard_end_operation_error_sv_rt"

}
