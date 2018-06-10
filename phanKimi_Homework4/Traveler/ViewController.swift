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
    @IBOutlet weak var tripLabel: UILabel!
    var trips: [Trip] = []
    var tripIndex: Int = 0
    var numTrips: Int = 0
    
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
        
        // trip 1
        let startDate = dateFormatter.date(from: "07/22/2014")
        let endDate = dateFormatter.date(from: "07/25/2014")
        
        addTrip(destination: "Amsterdam", startDate: startDate!, endDate: endDate!, fileName: "kimiPhanNetherlands.jpg")
        
        // trip 2
        let startDate1 = dateFormatter.date(from: "07/26/2013")
        let endDate1 = dateFormatter.date(from: "07/29/2013")
        
        addTrip(destination: "Sydney", startDate: startDate1!, endDate: endDate1!, fileName: "Sydney.jpg")
        
        // trip 3
        let startDate2 = dateFormatter.date(from: "12/31/2017")
        let endDate2 = dateFormatter.date(from: "01/03/2018")
        
        addTrip(destination: "Fountain Valley", startDate: startDate2!, endDate: endDate2!, fileName: "")
    }
    
    // a function that adds the trip to the trips array
    func addTrip(destination : String, startDate : Date, endDate : Date, fileName : String){
        let trip = Trip(destinationName : destination, startDate : startDate, endDate : endDate)
        trip.imageFileName = fileName
        self.trips.append(trip)
        numTrips = numTrips + 1
    }
    
    // display the trips
    func displayTrip(tripIndex : Int){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let trip = trips[tripIndex]
        
        // displays current trip number and number of trips
        if numTrips == 0 {
            self.tripLabel.text = "Trip \(tripIndex) of \(numTrips)"
        }
        self.tripLabel.text = "Trip \(tripIndex + 1) of \(numTrips)"
        
        // displays the destination
        self.destinationLabel.text = "Destination: " + trip.destinationName
        
        // displays the start date
        let startDate = dateFormatter.string(from: trip.startDate)
        self.startDateLabel.text = "Start Date: " + startDate
        
        // displays the end date
        let endDate = dateFormatter.string(from: trip.endDate)
        self.endDateLabel.text = "End Date: " + endDate
        
        // displays the picture if there is one
        if !(trip.imageFileName == nil){
            imageView.isHidden = false
            imageView.image = UIImage(named: trip.imageFileName!)
        } else {
            imageView.isHidden = true
        }
    }
    
    // sends info to AddTripVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTrip" {
            let destVC = segue.destination as? AddTripViewController
            destVC?.numTrip = numTrips + 1
        }
    }
    
    // action for next button
    @IBAction func nextButton(_ sender: UIButton) {
        if tripIndex == (numTrips - 1) {
            tripIndex = 0
            displayTrip(tripIndex: tripIndex)
        } else {
            tripIndex = tripIndex + 1
            displayTrip(tripIndex: tripIndex)
        }
    }
    
    @IBAction func unwindSegue (_ sender: UIStoryboardSegue){
        let destVC = sender.source as? AddTripViewController
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let startDate = dateFormatter.date(from: (destVC?.startDateField.text!)!)
        let endDate = dateFormatter.date(from: (destVC?.endDateField.text!)!)
        
        if destVC?.flag == 1 {
            self.tripLabel.text = "Trip \(tripIndex + 1) of \(numTrips + 1)"
            addTrip(destination: (destVC?.destinationField.text)!, startDate: startDate!, endDate: endDate!, fileName: "")
        }
    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
