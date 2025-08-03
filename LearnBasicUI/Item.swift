//
//  Item.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 20/07/25.
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
