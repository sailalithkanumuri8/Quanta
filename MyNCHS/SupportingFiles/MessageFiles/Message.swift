//
//  Message.swift
//  Vista
//
//  Created by Manvith Kothapalli on 12-22-23.
//

import Foundation

// Class for each individual message in MessageView
struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
