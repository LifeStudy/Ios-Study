//
//  Route.swift
//  SwiftBank
//
//  Created by ALURA on 22/03/24.
//

import SwiftUI
import SBLoan

enum Route {
    case loan(id: String, amount: String)
    case pix
    case error
}

extension Route: View {
    
    var body: some View {
        switch self {
        case .loan(let id, let amount):
            SBLoanView(amount)
        case .pix:
            PixView()
        case .error:
            GenericErrorView()
        }
    }
}

extension Route: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.loan, .loan):
            return true
        case (.pix, .pix):
            return true
        default:
            return false
        }
    }
}
