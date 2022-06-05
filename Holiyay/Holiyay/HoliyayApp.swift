//
//  HoliyayApp.swift
//  Holiyay
//
//  Created by MacBook on 24/05/22.
//

import SwiftUI

@main
struct HoliyayApp: App {
    @StateObject private var holidayData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .environmentObject(holidayData)
        }
    }
}
