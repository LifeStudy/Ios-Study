//
//  Task.swift
//  Tasky
//
//  Created by Giovanna Moeller on 28/05/24.
//

import Foundation

struct Task: Codable {
    var title: String
    var description: String?
    var isCompleted: Bool = false
}
