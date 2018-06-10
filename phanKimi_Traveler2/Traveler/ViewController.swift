//
//  ViewController.swift
//  Traveler
//
//  Created by Kimberlee Phan on 1/15/18.
//  Copyright © 2018 Kimberlee Phan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // outlets and variables
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var trips : [Trip] = []
    var tripIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        intializeTrips()
        displayTrip(tripIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // initialize the trips
    func intializeTrips(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let start = "07/22/2014"
        let startDate = dateFormatter.date(from: start)
        let end = "07/25/2014"
        let endDate = dateFormatter.date(from: end)
        
        let trip = Trip(destinationName: "Amsterdam", startDate: startDate!, endDate: endDate!)
        trip.imageFileName = "kimiPhanNetherlands.jpg"
        self.trips.append(trip)
        
        let start1 = "07/26/2013"
        let startDate1 = dateFormatter.date(from: start1)
        let end1 = "07/29/2013"
        let endDate1 = dateFormatter.date(from: end1)
        
        let trip2 = Trip(destinationName: "Sydney", startDate : startDate1!, endDate : endDate1!)
        trip2.imageFileName = "Sydney.jpg"
        self.trips.append(trip2)
        
        let start2 = "12/31/2017"
        let startDate2 = dateFormatter.date(from: start2)
        let end2 = "01/04/2018"
        let endDate2 = dateFormatter.date(from: end2)
        
        let trip3 = Trip(destinationName: "Fountain Valley", startDate : startDate2!, endDate : endDate2!)
        self.trips.append(trip3)
    }
    
    // display the trips
    func displayTrip(tripIndex : Int){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let trip = trips[tripIndex]
        
        self.destinationLabel.text = "Destination: " + trip.destinationName
        let startDate = dateFormatter.string(from: trip.startDate)
        self.startDateLabel.text = "Start Date: " + startDate
        let endDate = dateFormatter.string(from: trip.endDate)
        self.endDateLabel.text = "End Date: " + endDate
        if !(trip.imageFileName == nil){
            imageView.isHidden = false
            imageView.image = UIImage(named: trip.imageFileName!)
        } else {
            imageView.isHidden = true
        }
    }
    
    // action for next button
    @IBAction func nextButton(_ sender: UIButton) {
        if tripIndex == 2 {
            tripIndex = 0
            displayTrip(tripIndex: tripIndex)
        } else {
            tripIndex = tripIndex + 1
            displayTrip(tripIndex: tripIndex)
        }
    }
}
