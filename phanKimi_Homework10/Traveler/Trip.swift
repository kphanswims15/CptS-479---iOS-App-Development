//
//  Trip.swift
//  Traveler
//
//  Created by Larry Holder on 1/31/18.
//  Copyright © 2018 Washington State University. All rights reserved.
//

import Foundation

class Trip {
    var destinationName: String
    var startDate: Date
    var endDate: Date
    var imageFileName: String?
    
    init() {
        destinationName = ""
        startDate = Date()
        endDate = Date()
    }
}
