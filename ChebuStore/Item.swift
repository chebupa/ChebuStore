//
//  Item.swift
//  ChebuStore
//
//  Created by aristarh on 18.04.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
