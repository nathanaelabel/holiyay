//
//  HolidayDetail.swift
//  Holiyay
//
//  Created by MacBook on 01/06/22.
//

import SwiftUI

struct HolidayDetail: View {
    @EnvironmentObject var holidayData: ModelData
    @State private var isPresented = false
    var holiday: Holiday
    
    var body: some View {
        ScrollView {
            MapView(coordinate: holiday.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 265)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(holiday.name)
                        .font(.title)
                        .fontWeight(.heavy)
                }
                
                HStack(spacing: 20) {
                    Text(holiday.category.rawValue)
                        .padding(15)
                        .background(Capsule().stroke(lineWidth: 2))
                        .font(.system(size: 18, weight: .semibold, design: .default))
                    
                    Label(holiday.city + ", " + holiday.country, systemImage: "pin.fill")
                        .font(.system(size: 18, weight: .medium, design: .default))
                }
                .font(.subheadline)
                .foregroundColor(Color("LightBlue"))
                
                Divider()
                    .padding(.vertical, 6)
                
                Text(holiday.description)
                    .padding(.bottom)
                
                Button {
                    isPresented.toggle()
                } label: {
                    Label("Plan The Visit Date", systemImage: "calendar")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(LightBlueButton())
                .fullScreenCover(isPresented: $isPresented) {
                    CalendarView(holiday: self.holiday)
                }
            }
            .padding()
        }
        .navigationTitle(holiday.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CalendarView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var holidayData: ModelData
    var holiday: Holiday
    
    var holidayIndex: Int {
        holidayData.holidays.firstIndex(where: { $0.id == holiday.id })!
    }
    @State var visitDate = Date()
    
    func dateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        return dateFormatter.string(from: visitDate)
    }
    
    var body: some View {
        HStack {
            Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }
            Spacer()
        }
        .padding()
        
        VStack {
            
            Text("Set Plan")
                .font(.title2)
                .fontWeight(.heavy)
                .padding()
            
            Image("visit_date")
                .resizable()
                .scaledToFit()
                .padding(.bottom)
            
            DatePicker(selection: $visitDate, in: ...Date(), displayedComponents: .date) {
            }
            .onChange(of: visitDate) { _ in
                Bookmark.setup()
                Bookmark.holidays[holidayIndex].isBookmark = true
                print(dateFormat())
            }
            .datePickerStyle(GraphicalDatePickerStyle())
            .accentColor(Color("LightBlue"))
            .clipped()
            .labelsHidden()
            .padding(.horizontal)
            .foregroundColor(Color("LightGrey"))
            .padding()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Label("Save to Bookmark", systemImage: "bookmark.fill")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(LightBlueButton())
            .padding(.top, 25)
            .padding(.horizontal)
        }
    }
}

struct HolidayDetail_Previews: PreviewProvider {
    static let holidayData = ModelData()
    
    static var previews: some View {
        HolidayDetail(holiday: ModelData().holidays[0])
            .environmentObject(holidayData)
    }
}
