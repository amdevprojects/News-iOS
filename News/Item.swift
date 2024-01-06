//
//  Item.swift
//  News
//
//  Created by TTNPL-3940 on 06/01/24.
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
