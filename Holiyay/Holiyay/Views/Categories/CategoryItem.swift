//
//  CategoryItem.swift
//  Holiyay
//
//  Created by MacBook on 27/05/22.
//

import SwiftUI

struct CategoryItem: View {
    var holiday: Holiday

    var body: some View {
        VStack(alignment: .leading) {
            holiday.thumbnail
                .renderingMode(.original)
                .resizable()
                .frame(width: 185, height: 155)
                .cornerRadius(10)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(holiday: ModelData().holidays[0])
    }
}
