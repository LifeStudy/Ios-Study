//
//  GenericSection.swift
//  SwiftBank
//
//  Created by ALURA on 24/02/24.
//

import SwiftUI

struct GenericSection: GenericSectionView {
    
    var identifier = UUID()
    var model: GenericSectionResponse
    
    func build() -> AnyView {
        return AnyView(GenericView(genericResponse: model))
    }
}
