//
//  Bookmark.swift
//  Holiyay
//
//  Created by MacBook Pro on 02/06/22.
//

struct Bookmark {
    static var holidays: [Holiday] = []
    static func setup() {
        if holidays.isEmpty {
            holidays = load("holidayData.json")
        }
    }
}
