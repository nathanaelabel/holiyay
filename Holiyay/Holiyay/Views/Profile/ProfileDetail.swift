//
//  ProfileDetail.swift
//  Holiyay
//
//  Created by MacBook on 27/05/22.
//

import SwiftUI

struct ProfileDetail: View {
    
    @EnvironmentObject var holidayData: ModelData
    var profile: Profile
    
    var body: some View {
        
        VStack {
            (Text("Hello, ") +
             Text("\(profile.firstName) \(profile.lastName)"))
                .font(.system(size: 25))
                .fontWeight(.black)
                .padding()
            
            VStack() {
                Image(systemName: "person.text.rectangle.fill")                        .font(.system(size: 100))
                    .foregroundColor(Color("LightBlue"))
                    .padding()
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("\(Image(systemName: "quote.opening"))  First Name")
                        .bold()
                    Text(profile.firstName)
                        .foregroundColor(Color("LightGrey"))
                    
                    Text("\(Image(systemName: "quote.closing"))  Last Name")
                        .bold()
                    Text(profile.lastName)
                        .foregroundColor(Color("LightGrey"))
                    
                    (Text("\(Image(systemName: "flag.fill"))  Country of Domicile") +
                     Text("                        "))
                        .bold()
                    Text(profile.lastName)
                        .foregroundColor(Color("LightGrey"))
                    
                    Text("\(Image(systemName: "figure.stand"))  Gender")
                        .bold()
                    Text(profile.gender.rawValue)
                        .foregroundColor(Color("LightGrey"))
                    
                    Text("\(Image(systemName: "number"))  Age")
                        .bold()
                    Text(profile.age.description)
                        .foregroundColor(Color("LightGrey"))
                }
                .font(.title3)
            }
            .frame(width: UIScreen.main.bounds.width - 70)
            .padding()
            .background(Color("DarkGrey"))
            .foregroundColor(.white)
            .cornerRadius(15)
        }
        .padding(.top)
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationBarHidden(true)
    }
}

struct ProfileDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetail(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
