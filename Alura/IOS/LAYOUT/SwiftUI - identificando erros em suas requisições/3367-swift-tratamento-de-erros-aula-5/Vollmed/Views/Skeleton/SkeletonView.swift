//
//  SkeletonView.swift
//  Vollmed
//
//  Created by ALURA on 13/10/23.
//

import SwiftUI

struct SkeletonView: View {
    var body: some View {
        VStack(spacing: 35) {
            ForEach(0..<4, id: \.self) { index in
                SkeletonRow()
            }
        }
    }
}

struct SkeletonRow: View {
    
    private var placeholderString = "********************************"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                LinearGradient(gradient: Gradient(colors: [.gray, .white, .gray]), startPoint: .leading, endPoint: .trailing)
                    .mask(
                        Circle()
                            .frame(width: 60, height: 60, alignment: .leading)
                            .redactedAnimation()
                    )
                    .frame(width: 60, height: 60)
                
                VStack(alignment: .leading, spacing: 8.0) {
                    LinearGradient(gradient: Gradient(colors: [.gray, .white, .gray]), startPoint: .leading, endPoint: .trailing)
                        .mask(
                            Text(placeholderString)
                                .redacted(reason: .placeholder)
                                .redactedAnimation()
                        )
                    
                    LinearGradient(gradient: Gradient(colors: [.gray, .white, .gray]), startPoint: .leading, endPoint: .trailing)
                        .mask(
                            Text(placeholderString)
                                .redacted(reason: .placeholder)
                                .redactedAnimation()
                        )
                }
            }
        }
    }
}

#Preview {
    SkeletonView()
}
