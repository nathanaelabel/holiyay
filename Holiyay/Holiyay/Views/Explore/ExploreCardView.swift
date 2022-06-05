//
//  ExploreCardView.swift
//  Holiyay
//
//  Created by MacBook on 28/05/22.
//

import SwiftUI

struct ExploreCardView: View {
    @EnvironmentObject var holidayData: ModelData
    var holiday: Holiday
    
    var body: some View {
        HStack(alignment: .center) {
            holiday.thumbnail
                .resizable()
                .frame(width: 160, height: 160)
            
            VStack(alignment: .leading, spacing: 15) {
                Text(holiday.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Label(holiday.city + ", " + holiday.country, systemImage: "pin.fill")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .lineLimit(1)
                
                Label("Date", systemImage: "calendar")
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(Color("LightBlue"))
                    .foregroundColor(.white)
                    .font(.body.bold())
                    .cornerRadius(10)
                    .padding(.bottom, 4)
            }
            .foregroundColor(Color("LightGrey"))
            .padding()
        }
        .padding(.trailing, 18)
        .overlay(Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("LightBlue")]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 9, height: 160, alignment: .top), alignment: .trailing)
        .frame(maxWidth: .infinity, maxHeight: 160)
        .background(Color("DarkGrey"))
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding(.vertical, 10)
    }
}

struct ExploreCardView_Previews: PreviewProvider {
    static let holidayData = ModelData()
    
    static var previews: some View {
        ExploreCardView(holiday: holidays[0])
            .environmentObject(holidayData)
    }
}
