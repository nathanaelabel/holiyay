//
//  CategoryRow.swift
//  Holiyay
//
//  Created by MacBook on 27/05/22.
//

import SwiftUI

struct CategoryRow: View {
    var moreImages: Image
    var items: [Holiday]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { holiday in
                        NavigationLink {
                            HolidayDetail(holiday: holiday)
                        } label: {
                            CategoryItem(holiday: holiday)
                        }
                    }
                }
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var holiday = ModelData().holidays
    
    static var previews: some View {
        CategoryRow(
            moreImages: holiday[0].thumbnail,
            items: Array(holiday.prefix(4))
        )
    }
}
