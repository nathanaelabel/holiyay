//
//  ProfileView.swift
//  Holiyay
//
//  Created by MacBook Pro on 27/05/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var holidayData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Text("")
                    .toolbar {
                        Button {
                            showingProfile.toggle()
                        } label: {
                            Label("Edit Profile", systemImage: "pencil")
                        }
                    }
                    .sheet(isPresented: $showingProfile) {
                        ProfileHost()
                            .environmentObject(holidayData)
                    }
                
                ProfileDetail(profile: holidayData.profile)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ModelData())
    }
}
