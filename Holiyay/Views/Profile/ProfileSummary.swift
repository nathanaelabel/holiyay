//
//  ProfileSummary.swift
//  Holiyay
//
//  Created by SIFT - Telkom DBT Air 9 on 17/05/22.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("First Name: \(profile.firstName)")
                Text("Last Name: \(profile.lastName)")
                Text("Country of Domicile: \(profile.country)")
                Text("Gender: \(profile.gender)")
                Text("Age: \(profile.age)")
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
