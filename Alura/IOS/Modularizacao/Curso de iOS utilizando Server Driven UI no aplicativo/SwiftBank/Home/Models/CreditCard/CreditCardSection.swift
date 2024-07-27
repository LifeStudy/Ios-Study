//
//  CreditCardSection.swift
//  SwiftBank
//
//  Created by ALURA on 24/02/24.
//

import SwiftUI

struct CreditCardSection: GenericSectionView {
    
    var identifier = UUID()
    var model: CreditCardResponse
    
    func build() -> AnyView {
        return AnyView(CreditCardView(creditCardResponse: model))
    }
}
