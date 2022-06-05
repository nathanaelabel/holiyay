//
//  Profile.swift
//  Holiyay
//
//  Created by MacBook on 24/05/22.
//

import Foundation

struct Profile {
    
    var firstName: String
    var lastName: String
    var country: String
    var gender = Gender.male
    var age: Int
    
    static let `default` = Profile(firstName: "John", lastName: "Doe", country: "United States", age: 20)
    
    enum Gender: String, CaseIterable, Identifiable {
        case male = "Male"
        case female = "Female"
        
        var id: String { rawValue }
    }
    
}
