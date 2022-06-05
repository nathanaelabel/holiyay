//
//  ProfileHost.swift
//  Holiyay
//
//  Created by MacBook Pro on 27/05/22.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode
    @EnvironmentObject var holidayData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = holidayData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileDetail(profile: holidayData.profile)
            } else {
                ProfileEdit(profile: $draftProfile)
                    .onAppear {
                        draftProfile = holidayData.profile
                    }
                    .onDisappear {
                        holidayData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
