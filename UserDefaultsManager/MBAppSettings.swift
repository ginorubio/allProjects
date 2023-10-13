
import Foundation

public struct MBAppSettings {
    
    public struct LoginKeys {
        @UserDefaultsManager(valueKey: .user_dni, dataStorage: "")
        public static var user_dni: String
        
        @UserDefaultsManager(valueKey: .user_name_value, dataStorage: "")
        public static var user_name: String
        
        @UserDefaultsManager(valueKey: .check_dni, dataStorage: false)
        public static var save_dni: Bool
        
        @UserDefaultsManager(valueKey: .user_dni_auxiliar, dataStorage: "")
        public static var user_dni_auxiliar: String
        
        @UserDefaultsManager(valueKey: .user_name_value_auxliar, dataStorage: "")
        public static var user_name_auxiliar: String
    }
    
    public struct BiometryKeys {
        @UserDefaultsManager(valueKey: .buhofacil_active_value, dataStorage: false)
        public static var bufacil_active: Bool
        
        @UserDefaultsManager(valueKey: .biometry_active_value, dataStorage: false)
        public static var biometry_active: Bool
        
        @UserDefaultsManager(valueKey: .transfer_active_value, dataStorage: false)
        public static var transfer_active: Bool
        
        @UserDefaultsManager(valueKey: .qr_active_value, dataStorage: false)
        public static var qr_active: Bool
        
        @UserDefaultsManager(valueKey: .biometry_option_secondary_value, dataStorage: false)
        public static var biometry_secondary: Bool
        
        @UserDefaultsManager(valueKey: .biometry_account_name, dataStorage: "")
        public static var biometry_account_name: String
        
        @UserDefaultsManager(valueKey: .cookie_value_download, dataStorage: "")
        public static var cookie_value: String
        
        @UserDefaultsManager(valueKey: .biometry_isva_status, dataStorage: false)
        public static var isva_biometry_status: Bool
        
        @UserDefaultsManager(valueKey: .biometry_register_status, dataStorage: false)
        public static var biometry_register: Bool
        
        @UserDefaultsManager(valueKey: .not_today_flag, dataStorage: false)
        public static var not_today: Bool
        
        @UserDefaultsManager(valueKey: .from_switch_enroll, dataStorage: false)
        public static var enroll_switch: Bool
        
        @UserDefaultsManager(valueKey: .is_pop_error_registry, dataStorage: false)
        public static var registry_error: Bool
        
        @UserDefaultsManager(valueKey: .is_pop_error_bio_registry, dataStorage: false)
        public static var biometry_register_error: Bool
        
        @UserDefaultsManager(valueKey: .is_error_activate_buho, dataStorage: false)
        public static var buhofacil_activate_error: Bool
        
        @UserDefaultsManager(valueKey: .daily_check_biometry_register, dataStorage: nil)
        public static var biometry_check_date: Date?
        
        @UserDefaultsManager(valueKey: .biometry_deleted_from_configuration, dataStorage: false)
        public static var biometry_config_reset: Bool
    }
    
    public struct TokenKeys {
        @UserDefaultsManager(valueKey: .tenant_mobile_hipotecario, dataStorage: "tenant_mobile_hipotecario")
        public static var tenant_id: String
        
        @UserDefaultsManager(valueKey: .expire_time, dataStorage: 0)
        public static var expired_time: Int
        
        @UserDefaultsManager(valueKey: .token_apns, dataStorage: MBConstant.TOKENDUMMY)
        public static var token_push: String
        
        @UserDefaultsManager(valueKey: .publicKey, dataStorage: nil)
        public static var public_key: String?
        
        @UserDefaultsManager(valueKey: .savedContext, dataStorage: nil)
        public static var biometry_context: Data?
        
        @UserDefaultsManager(valueKey: .token_remain_time, dataStorage: Date())
        public static var token_remain_time: Date
    }
    
    public struct BiometryValidation {
        @UserDefaultsManager(valueKey: .isBiometryForTransferEnabled, dataStorage: false)
        public static var biometry_transfer: Bool
    }
    
    public struct General {
        @UserDefaultsManager(valueKey: .newLoginSplashFlag, dataStorage: true)
        public static var splash_login: Bool
        
        @UserDefaultsManager(valueKey: .isAnUpdatePostV6, dataStorage: true)
        public static var update_post_v6: Bool
        
        @UserDefaultsManager(valueKey: .hasDismissedMovementAnalysisTabToolTip, dataStorage: false)
        public static var dismiss_tooltip_movement: Bool
        
        @UserDefaultsManager(valueKey: .last_login_date, dataStorage: "")
        public static var last_login: String
        
        @UserDefaultsManager(valueKey: .show_popup_onlyToday_biobuho_notRegistered, dataStorage: nil)
        public static var show_popup_onlytoday_register_buho_not_register: Date?
        
        @UserDefaultsManager(valueKey: .futureMaintenanceMessage, dataStorage: "")
        public static var future_mantenance_message: String
        
        @UserDefaultsManager(valueKey: .isBiometricEnabled, dataStorage: true)
        public static var isBiometricEnabled: Bool
        
        @UserDefaultsManager(valueKey: .show_onboarding, dataStorage: false)
        public static var show_onboarding: Bool
        
        @UserDefaultsManager(valueKey: .tenure_ddjj_sell_dollars, dataStorage: "")
        public static var tenure_ddjj_sell_dollars: String
        
        @UserDefaultsManager(valueKey: .tenure_ddjj_sell_pesos, dataStorage: "")
        public static var tenure_ddjj_sell_pesos: String
        
        @UserDefaultsManager(valueKey: .tenure_ddjj_purchase_dollars, dataStorage: "")
        public static var tenure_ddjj_purchase_dollars: String
        
        @UserDefaultsManager(valueKey: .tenure_ddjj_purchase_pesos, dataStorage: "")
        public static var tenure_ddjj_purchase_pesos: String
        
        @UserDefaultsManager(valueKey: .show_data_valid, dataStorage: nil)
        public static var data_valid_check_date: Date?
    }
    
    public struct DuoBalance {
        @UserDefaultsManager(valueKey: .no_pack_duo, dataStorage: "")
        public static var no_pack_duo_balance: String
        
        @UserDefaultsManager(valueKey: .easy_pack_duo, dataStorage: "")
        public static var easy_pack_duo_balance: String

        @UserDefaultsManager(valueKey: .buho_pack_duo, dataStorage: "")
        public static var buho_pack_duo_balance: String

        @UserDefaultsManager(valueKey: .gold_pack_duo, dataStorage: "")
        public static var gold_pack_duo_balance: String

        @UserDefaultsManager(valueKey: .platinum_pack_duo, dataStorage: "")
        public static var platinum_pack_duo_balance: String

        @UserDefaultsManager(valueKey: .black_pack_duo, dataStorage: "")
        public static var black_pack_duo_balance: String
    }

    public struct Onboarding {
        @UserDefaultsManager(valueKey: .show_onboarding_hml, dataStorage: false)
        public static var show_onboarding_hml: Bool
        @UserDefaultsManager(valueKey: .link_sucursal_hml, dataStorage: "")
        public static var link_sucursal_hml: String 
        @UserDefaultsManager(valueKey: .user_gender, dataStorage: "")
        public static var user_gender: String
        
        @UserDefaultsManager(valueKey: .operationGiud, dataStorage: "")
        public static var operation_guid: String
        @UserDefaultsManager(valueKey: .operationId, dataStorage: 0)
        public static var operation_id: Int
        
        @UserDefaultsManager(valueKey: .id_referred, dataStorage: "")
        public static var id_referred: String
    }
    
    public struct SoftToken{
        @UserDefaultsManager(valueKey: .softtoken_id, dataStorage: nil)
        public static var id_softtoken: String?
        
        @UserDefaultsManager(valueKey: .last_softtoken_used, dataStorage: "")
        public static var id_last_softtoken_used: String
        
        @UserDefaultsManager(valueKey: .softtoken_seed, dataStorage: nil)
        public static var softtoken_data: String?
        
        @UserDefaultsManager(valueKey: .softtoken_countdown_time, dataStorage: 0)
        public static var softtoken_countdown_time: Int
        
        @UserDefaultsManager(valueKey: .softtoken_algorithm, dataStorage: "HmacSHA1")
        public static var softtoken_algorithm_type: String
        
        @UserDefaultsManager(valueKey: .countdown_softtoken_block, dataStorage: nil)
        public static var softtoken_countdown_blocked: String?
        
        @UserDefaultsManager(valueKey: .show_softtoken_campaign, dataStorage: nil)
        public static var softtoken_check_date: Date?
        
        @UserDefaultsManager(valueKey: .is_softtoken_registered, dataStorage: false)
        public static var is_softtoken_registered: Bool
    }
    
    public struct ScanDNIFraud {
        @UserDefaultsManager(valueKey: .scan_dni_status, dataStorage: true)
        public static var is_scandni_active: Bool
    }
}
