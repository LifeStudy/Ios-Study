//
//  Route.swift
//  SwiftBank
//
//  Created by ALURA on 22/03/24.
//

import SwiftUI
import SBLoan

enum Route {
    case loan
    case pix
}

extension Route: View {
    
    var body: some View {
        switch self {
        case .loan:
            SBLoanView()
        case .pix:
            PixView()
        }
    }
    
}
