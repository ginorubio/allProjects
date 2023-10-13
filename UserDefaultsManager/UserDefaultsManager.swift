
import Foundation

@propertyWrapper
public struct UserDefaultsManager<T> {
    private let keyValue: MBUserDefultsKeys
    private let valueData: T
    private let userDefaults: UserDefaults = .standard
    
    public init(valueKey: MBUserDefultsKeys, dataStorage: T) {
        keyValue = valueKey
        valueData = dataStorage
    }
    
    public var wrappedValue: T {
        get { userDefaults.value(forKey: keyValue.rawValue) as? T ?? valueData }
        set {
            switch (newValue as Any) {
            case Optional<Any>.some(let value):
                userDefaults.set(value, forKey: keyValue.rawValue)
            case Optional<Any>.none:
                userDefaults.removeObject(forKey: keyValue.rawValue)
            default:
                userDefaults.set(newValue, forKey: keyValue.rawValue)
            }
        }
    }
}

