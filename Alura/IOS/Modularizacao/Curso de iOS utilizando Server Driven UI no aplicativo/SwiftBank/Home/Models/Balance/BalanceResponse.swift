//
//  BalanceResponse.swift
//  SwiftBank
//
//  Created by ALURA on 23/02/24.
//

import Foundation

struct BalanceResponse: Decodable {
    
    private(set) var amount: Amount
    private(set) var items: [BalanceItem]
    
    struct Amount: Decodable {
        private enum CodingKeys: String, CodingKey {
            case currencySymbol = "currency_symbol"
            case value
        }
        
        private(set) var currencySymbol: String
        private(set) var value: TextModel
    }
    
    struct BalanceItem: Decodable {
        private(set) var id: String
        private(set) var title: TextModel
        private(set) var icon: String
    }
}
