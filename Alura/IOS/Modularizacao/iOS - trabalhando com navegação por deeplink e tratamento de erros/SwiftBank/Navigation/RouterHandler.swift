//
//  RouterHandler.swift
//  SwiftBank
//
//  Created by ALURA on 22/03/24.
//

import Foundation

enum DeeplinkURL: String {
    case loan = "loan"
    case pix = "pix"
}

struct RouterHandler {
    
    func find(from url: URL) async -> Route? {
        
        guard let host = url.host() else { return nil }
        
        switch DeeplinkURL(rawValue: host) {
        case .loan:
            return .loan
        case .pix:
            return .pix
        default:
            return nil
        }
    }
}
