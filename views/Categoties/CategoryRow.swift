//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Ahmed Shawky on 08/02/2025.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0){
                    ForEach(items) {
                        landmark in
                        NavigationLink{
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let landmarkes = ModelData().landmarks
    CategoryRow(
        categoryName: landmarkes[0].category.rawValue,
        items: Array(landmarkes.prefix(4))
    )
}
