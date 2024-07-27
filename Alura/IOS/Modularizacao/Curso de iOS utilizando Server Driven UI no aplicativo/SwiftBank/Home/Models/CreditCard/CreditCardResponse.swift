//
//  CreditCardResponse.swift
//  SwiftBank
//
//  Created by ALURA on 24/02/24.
//

import Foundation

struct CreditCardResponse: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case title, icon, subtitle, value
        case dueDate = "due_date"
    }
    
    // MARK: - Attributes
    
    private(set) var title: TextModel
    private(set) var icon: String
    private(set) var subtitle: TextModel
    private(set) var value: TextModel
    private(set) var dueDate: TextModel
}
