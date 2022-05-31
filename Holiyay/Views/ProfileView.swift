//
//  ProfileView.swift
//  Holiyay
//
//  Created by MacBook on 31/05/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var holidayData: ModelData
    @State private var editProfile = false
    
    var profile: Profile
    
    var body: some View {
        NavigationView {
            Text("Keep your identity updated")
                .font(.title)
                .fontWeight(.black)
                .frame(maxHeight: .infinity, alignment: .top)
                .toolbar {
                    Button {
                        editProfile.toggle()
                    } label: {
                        Label("Edit Profile", systemImage: "pencil")
                    }
                }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("First Name: \(profile.firstName)")
                    Text("Last Name: \(profile.lastName)")
                    Text("Country: \(profile.country)")
                    Text("Gender: \(profile.gender.rawValue)")
                    Text("Age: \(profile.age)")
                }
            }
            
            //                .sheet(isPresented: $editProfile) {
            //                    ProfileEdit()
            //                        .environmentObject(destinationData)
            //                }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: Profile.default)
    }
}

