//
//  Trip.swift
//  Traveler
//
//  Created by Kimberlee Phan on 1/23/18.
//  Copyright © 2018 Kimberlee Phan. All rights reserved.
//

import Foundation

class Trip {
    var destinationName : String
    var startDate : Date
    var endDate : Date
    var imageFileName : String?
    var rating: Int = 0
    
    init(destinationName : String, startDate : Date, endDate : Date){
        self.destinationName = destinationName
        self.startDate = startDate
        self.endDate = endDate
    }
}
