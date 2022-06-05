//
//  BookmarkView.swift
//  Holiyay
//
//  Created by MacBook on 01/06/22.
//

import SwiftUI

struct BookmarkView: View {
    
    @EnvironmentObject var holidayData: ModelData
    @State private var filter = FilterCategory.all
    @State private var selectedHoliday: Holiday?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case beaches = "Beaches"
        case forest = "Forests"
        case mountains = "Mountains"
        case desert = "Deserts"
        
        var id: FilterCategory { self }
    }
    
    var filteredHolidays: [Holiday] {
        holidayData.holidays.filter { holiday in
            (holiday.isBookmark)
            && (filter == .all || filter.rawValue == holiday.category.rawValue)
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Realize your plan")
                        .font(.title)
                        .fontWeight(.black)
                        .toolbar {
                            ToolbarItemGroup(placement: .navigationBarTrailing) {
                                Button(action: {
                                    print("Sort by Holiday Name")
                                }) {
                                    Label("Sort", systemImage: "arrow.up.arrow.down")
                                }
                                Menu {
                                    Picker("Category", selection: $filter) {
                                        ForEach(FilterCategory.allCases) { category in
                                            Text(category.rawValue).tag(category)
                                        }
                                    }
                                    .pickerStyle(.inline)
                                } label: {
                                    Label("Filter", systemImage: "slider.horizontal.3")
                                }
                            }
                        }
                    
                    ForEach(filteredHolidays) { holiday in
                        NavigationLink {
                            HolidayDetail(holiday: holiday)
                        } label: {
                            BookmarkCardView(holiday: holiday)
                        }
                        .tag(holiday)
                    }
                }
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}
