//
//  DateFormatterExtension.swift
//
//  Created by Mohamed Gamal on 4/14/18.
//

import Foundation

public extension DateFormatter {
    
    static func dateFromFormat(_ formate: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        dateFormatter.locale = Locale.current
    }
}



