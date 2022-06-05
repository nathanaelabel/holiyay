//
//  Holiday.swift
//  Holiyay
//
//  Created by MacBook on 24/05/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct Holiday: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var country: String
    var description: String
    var city: String
    var isBookmark: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case beaches = "Beaches"
        case deserts = "Deserts"
        case forests = "Forests"
        case mountains = "Mountains"
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    private var image: String
    var thumbnail: Image {
        Image(image)
    }
}
