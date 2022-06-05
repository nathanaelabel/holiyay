//
//  SplashScreen.swift
//  Holiyay
//
//  Created by MacBook on 31/05/22.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.75
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Spacer()
                
                VStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 40)
                    Text("Holiyay")
                        .fontWeight(.black)
                        .foregroundColor(Color("LightBlue"))
                        .font(.system(size: 60))
                }
                
                Spacer()
                
                VStack {
                    Text("&copy; 2022 Archotech")
                        .fontWeight(.medium)
                        .foregroundColor(Color("LightGrey"))
                }
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.0)) {
                    self.size = 0.75
                    self.opacity = 1.0
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.isActive = true
                }
            }
            .statusBar(hidden: true)
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
