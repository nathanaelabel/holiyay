//
//  ContentView.swift
//  Holiyay
//
//  Created by MacBook on 24/05/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            
            ExploreView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Explore")
                }
            
            BookmarkView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Bookmark")
                }
            
            ProfileHost()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .environmentObject(ModelData())
    }
}

struct LightBlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        configuration
            .label
            .padding()
            .background(Color("LightBlue"))
            .foregroundColor(.white)
            .cornerRadius(10)
            .font(.body.bold())
    }
}

struct SkyBlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        configuration
            .label
            .padding()
            .background(Color("SkyBlue"))
            .foregroundColor(Color("LightBlue"))
            .cornerRadius(10)
            .font(.body.bold())
    }
}
