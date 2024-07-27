//
//  BalanceSection.swift
//  SwiftBank
//
//  Created by ALURA on 23/02/24.
//

import SwiftUI

struct BalanceSection: GenericSectionView {
    
    var identifier = UUID()
    var model: BalanceResponse
    
    func build() -> AnyView {
        return AnyView(BalanceView(balanceResponse: model))
    }
}
