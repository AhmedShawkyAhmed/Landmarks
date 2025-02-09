//
//  PageView.swift
//  Landmarks
//
//  Created by Ahmed Shawky on 09/02/2025.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPageIndex = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPageIndex)
            PageControl(
                numberOfPages: pages.count,
                currentPage: $currentPageIndex
            ).frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().features.map {FeatureCard(landmark: $0)})
}
