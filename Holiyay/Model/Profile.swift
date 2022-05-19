//
//  Profile.swift
//  Holiyay
//
//  Created by MacBook Pro on 11/05/22.
//

import Foundation

struct Profile {
    var firstName: String
    var lastName: String
    var country: String
    var gender: String
    var age: Int

    static let `default` = Profile(firstName: "John", lastName: "Doe", country: "United States", gender: "Male", age: 20)
}
