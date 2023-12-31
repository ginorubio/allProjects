import Foundation

public struct EditSavingsTransactionDTO {
    public var value: Double
    public var isAdd: Bool
    public var date: Date
    public var currency: String

    public init(_ data: [String: Any]) {
        self.value = data["value"] as? Double ?? 0.0
        self.isAdd = data["isAdd"] as? Bool ?? false
        self.date = data["date"] as? Date ?? Date()
        self.currency = data["currency"] as? String ?? ""
    }

    public func toDictionary() -> [String: Any] {
        return [
            "value": value,
            "isAdd": isAdd,
            "date": date.timeIntervalSince1970,
            "currency": currency
        ]
    }
}
