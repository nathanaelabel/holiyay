//
//  BookmarkCardView.swift
//  Holiyay
//
//  Created by MacBook on 01/06/22.
//

import SwiftUI

struct BookmarkCardView: View {
    @EnvironmentObject var holidayData: ModelData
    var holiday: Holiday
    
    var body: some View {
        VStack(alignment: .leading) {
            holiday.thumbnail
                .resizable()
                .scaledToFill()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(holiday.name)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    HStack(spacing:20) {
                        Button(action: {}) {
                            Text(holiday.category.rawValue)
                                .padding()
                        }
                        .background(Capsule().stroke(lineWidth: 2))
                        .font(.system(size: 18, weight: .semibold, design: .default))
                        
                        Label(holiday.city + ", " + holiday.country, systemImage: "pin.fill")
                            .font(.system(size: 18, weight: .medium, design: .default))
                            .lineLimit(1)
                    }
                    .font(.subheadline)
                    .foregroundColor(Color("LightGrey"))
                    .padding(.bottom)
                }
            }
            .padding(20)
        }
        .background(Color("DarkGrey"))
        .cornerRadius(16)
        .padding(.bottom)
    }
}

struct BookmarkCardView_Previews: PreviewProvider {
    static let holidayData = ModelData()
    
    static var previews: some View {
        BookmarkCardView(holiday: ModelData().holidays[0])
            .environmentObject(holidayData)
    }
}
