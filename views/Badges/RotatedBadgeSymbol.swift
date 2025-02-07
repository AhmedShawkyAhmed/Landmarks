//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Ahmed Shawky on 29/01/2025.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 15))
}
