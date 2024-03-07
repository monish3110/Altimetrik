//
//  String-Extension.swift
//  Altimetrik
//
//  Created by Monish M on 07/03/24.
//

import Foundation

extension String {
    
    var toDisplayDateFormat: String? {
        let inputFormatter = ISO8601DateFormatter()
        guard let date = inputFormatter.date(from: self) else {
            return nil
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MMM d yyyy hh:mm a"
        
        return outputFormatter.string(from: date)
    }
    
}
