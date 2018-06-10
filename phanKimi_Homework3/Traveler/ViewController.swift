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
    @IBOutlet weak var destinationTxt: UITextField!
    @IBOutlet weak var startDateTxt: UITextField!
    @IBOutlet weak var endDateTxt: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    var trips : [Trip] = []
    var tripIndex : Int = 0
    var numTrips : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        intializeTrips()
        displayTrip(tripIndex: 0)
        errorLabel.text = ""
        destinationTxt.delegate = self
        startDateTxt.delegate = self
        endDateTxt.delegate = self
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
    
    // action for the save button
    @IBAction func saveButton(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        // try to convert the user input to dates
        let startDate = dateFormatter.date(from: startDateTxt.text!)
        let endDate = dateFormatter.date(from: endDateTxt.text!)
        
        // checks if destination is valid
        if destinationTxt.text == "" {
            errorLabel.text = "Missing destination"
            return
        }
        
        // checks if start date is valid
        if startDate == nil {
            errorLabel.text = "Invalid start date"
            return
        }
        
        // checks if end date is valid
        if endDate == nil {
            errorLabel.text = "Invalid end date"
            return
        }
        
        errorLabel.text = ""
        
        // all fields are valid and add it to the trip array
        addTrip(destination: destinationTxt.text!, startDate: startDate!, endDate: endDate!, fileName: "")
        destinationTxt.text = ""
        startDateTxt.text = ""
        endDateTxt.text = ""
    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
