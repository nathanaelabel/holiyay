//
//  ExploreView.swift
//  Holiyay
//
//  Created by MacBook on 28/05/22.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var holidayData: ModelData
    @State private var topPadding: Bool = true
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack {
                    Categories()
                        .frame(width: UIScreen.main.bounds.width - 45, height: 320)
                    
                    VStack {
                        Text("Start your memorable holiday")
                            .font(.system(size: 25))
                            .fontWeight(.black)
                        
                        ScrollView {
                            DisclosureGroup("Beaches", isExpanded: $topPadding) {
                                
                                ForEach(holidays) { holiday in
                                    
                                    if holiday.category.rawValue == "Beaches" {
                                        NavigationLink {
                                            HolidayDetail(holiday: holiday)
                                        } label: {
                                            ExploreCardView(holiday: holiday)
                                        }
                                        .tag(holiday)
                                    }
                                }
                            }
                            
                            DisclosureGroup("Mountains") {
                                
                                ForEach(holidays) { holiday in
                                    
                                    if holiday.category.rawValue == "Mountains" {
                                        NavigationLink {
                                            HolidayDetail(holiday: holiday)
                                        } label: {
                                            ExploreCardView(holiday: holiday)
                                        }
                                        .tag(holiday)
                                    }
                                }
                            }
                            
                            DisclosureGroup("Forests") {
                                
                                ForEach(holidays) { holiday in
                                    
                                    if holiday.category.rawValue == "Forests" {
                                        NavigationLink {
                                            HolidayDetail(holiday: holiday)
                                        } label: {
                                            ExploreCardView(holiday: holiday)
                                        }
                                        .tag(holiday)
                                    }
                                }
                            }
                            
                            DisclosureGroup("Deserts") {
                                
                                ForEach(holidays) { holiday in
                                    
                                    if holiday.category.rawValue == "Deserts" {
                                        NavigationLink {
                                            HolidayDetail(holiday: holiday)
                                        } label: {
                                            ExploreCardView(holiday: holiday)
                                        }
                                        .tag(holiday)
                                    }
                                }
                            }
                            
                        }
                    }
                }
                .padding()
                .navigationBarHidden(true)
            }
        }
    }
}

struct Categories: View {
    
    var body: some View {
        TabView {
            Image("beach_carousel")
                .resizable()
                .scaledToFill()
                .overlay(Text("Beach"), alignment: .bottom)
                .padding(.bottom, 50)
                .foregroundColor(.blue)
            
            Image("forest_carousel")
                .resizable()
                .scaledToFill()
                .overlay(Text("Forest"), alignment: .bottom)
                .padding(.bottom, 50)
                .foregroundColor(.green)
            
            Image("mountain_carousel")
                .resizable()
                .scaledToFill()
                .overlay(Text("Mountain"), alignment: .bottom)
                .padding(.bottom, 50)
                .foregroundColor(.blue)
            
            Image("desert_carousel")
                .resizable()
                .scaledToFill()
                .overlay(Text("Desert"), alignment: .bottom)
                .padding(.bottom, 50)
                .foregroundColor(.yellow)
        }
        .font(.title2.bold())
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
