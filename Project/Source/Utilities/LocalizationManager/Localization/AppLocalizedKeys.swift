//
//  AppLocalizedKeys.swift
//  ChatRoom
//
//  Created by Ali M. Zaghloul on 23/10/2023.
//


import UIKit

// MARK: - app Localized keys

enum AppLocalizedKeys: String, CaseIterable {
    case none
    
    //MARK:- Auth Module
    case invoiceNum
    case reponseDataNullKey
    case poNumber
    case driverName
    case phoneNum
    case arrivalDate

}

extension AppLocalizedKeys {
    var value: String {
        return self.rawValue.localized
    }
    
    static func byName(name: String?) -> AppLocalizedKeys {
        return AppLocalizedKeys.allCases.first(where: {$0.value == name}) ?? .none
    }
}
