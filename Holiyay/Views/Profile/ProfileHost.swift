//
//  ProfileHost.swift
//  Holiyay
//
//  Created by SIFT - Telkom DBT Air 9 on 17/05/22.
//

import SwiftUI

struct ProfileHost: View {
    var profile: Profile
    
    @State private var draftProfile = Profile.default

    var body: some View {
        Text("Profile for: \(draftProfile.firstName)")
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost(profile: Profile.default)
    }
}
