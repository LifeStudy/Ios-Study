//
//  GenericSectionResponse.swift
//  SwiftBank
//
//  Created by ALURA on 24/02/24.
//

import Foundation

struct GenericSectionResponse: Decodable {
    
    // MARK: - Attributes
    
    private(set) var title: TextModel
    private(set) var subtitle: TextModel
}
