//
//  GenericSectionView.swift
//  SwiftBank
//
//  Created by ALURA on 23/02/24.
//

import SwiftUI

protocol GenericSectionView {
    var identifier: UUID { get set }
    func build() -> AnyView
}
