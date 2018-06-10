//
//  ViewController.swift
//  Traveler
//
//  Created by Kimberlee Phan on 1/15/18.
//  Copyright © 2018 Kimberlee Phan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    // outlets and variables
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    var trips : [Trip] = []
    var tripIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        intializeTrips()
        displayTrip(tripIndex: 0)
        
        // setting tap gestures for each star
        let star1TapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleStar1Tap))
        let star2TapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleStar2Tap))
        let star3TapGestrueRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleStar3Tap))
        let star4TapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleStar4Tap))
        let star5TapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleStar5Tap))
        
        star1TapGestureRecognizer.delegate = self
        star2TapGestureRecognizer.delegate = self
        star3TapGestrueRecognizer.delegate = self
        star4TapGestureRecognizer.delegate = self
        star5TapGestureRecognizer.delegate = self
        
        star1.isUserInteractionEnabled = true
        star2.isUserInteractionEnabled = true
        star3.isUserInteractionEnabled = true
        star4.isUserInteractionEnabled = true
        star5.isUserInteractionEnabled = true
        
        star1.addGestureRecognizer(star1TapGestureRecognizer)
        star2.addGestureRecognizer(star2TapGestureRecognizer)
        star3.addGestureRecognizer(star3TapGestrueRecognizer)
        star4.addGestureRecognizer(star4TapGestureRecognizer)
        star5.addGestureRecognizer(star5TapGestureRecognizer)
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
        let goldStar = "goldStar.png"
        let greyStar = "greyStar.png"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let trip = trips[tripIndex]
        
        // displays the labels and images
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
        
        // displays the star ratings
        if trip.rating == 0 {
            star1.image = UIImage(named: greyStar)
            star2.image = UIImage(named: greyStar)
            star3.image = UIImage(named: greyStar)
            star4.image = UIImage(named: greyStar)
            star5.image = UIImage(named: greyStar)
        } else if trip.rating == 1 {
            star1.image = UIImage(named: goldStar)
            star2.image = UIImage(named: greyStar)
            star3.image = UIImage(named: greyStar)
            star4.image = UIImage(named: greyStar)
            star5.image = UIImage(named: greyStar)
        } else if trip.rating == 2 {
            star1.image = UIImage(named: goldStar)
            star2.image = UIImage(named: goldStar)
            star3.image = UIImage(named: greyStar)
            star4.image = UIImage(named: greyStar)
            star5.image = UIImage(named: greyStar)
        } else if trip.rating == 3 {
            star1.image = UIImage(named: goldStar)
            star2.image = UIImage(named: goldStar)
            star3.image = UIImage(named: goldStar)
            star4.image = UIImage(named: greyStar)
            star5.image = UIImage(named: greyStar)
        } else if trip.rating == 4 {
            star1.image = UIImage(named: goldStar)
            star2.image = UIImage(named: goldStar)
            star3.image = UIImage(named: goldStar)
            star4.image = UIImage(named: goldStar)
            star5.image = UIImage(named: greyStar)
        } else if trip.rating == 5 {
            star1.image = UIImage(named: goldStar)
            star2.image = UIImage(named: goldStar)
            star3.image = UIImage(named: goldStar)
            star4.image = UIImage(named: goldStar)
            star5.image = UIImage(named: goldStar)
        }
    }
    
    // handlers for gestures
    @IBAction func handleSwipeRight(_ sender: UIGestureRecognizer){
        if sender.state == .ended {
            if tripIndex == 0 {
                tripIndex = 2
            } else {
                tripIndex = tripIndex - 1
            }
            displayTrip(tripIndex: tripIndex)
        }
    }
    
    @IBAction func handleSwipeLeft(_ sender: UIGestureRecognizer){
        if sender.state == .ended {
            if tripIndex == 2 {
                tripIndex = 0
            } else {
                tripIndex = tripIndex + 1;
            }
            displayTrip(tripIndex: tripIndex)
        }
    }
    
    @objc func handleStar1Tap (_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
            trips[tripIndex].rating = 1
            displayTrip(tripIndex: tripIndex)
        }
    }
    
    @objc func handleStar2Tap (_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
            trips[tripIndex].rating = 2
            displayTrip(tripIndex: tripIndex)
        }
    }
    
    @objc func handleStar3Tap (_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
            trips[tripIndex].rating = 3
            displayTrip(tripIndex: tripIndex)
        }
    }
    
    @objc func handleStar4Tap (_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
            trips[tripIndex].rating = 4
            displayTrip(tripIndex: tripIndex)
        }
    }
    
    @objc func handleStar5Tap (_ sender: UITapGestureRecognizer){
        if sender.state == .ended {
            trips[tripIndex].rating = 5
            displayTrip(tripIndex: tripIndex)
        }
    }
}
