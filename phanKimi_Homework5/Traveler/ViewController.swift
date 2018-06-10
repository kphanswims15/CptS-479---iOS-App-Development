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
    
    var destinationText: String = ""
    var startDate: Date?
    var endDate: Date?
    var picName: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let startDate1 = dateFormatter.string(from: startDate!)
        let endDate1 = dateFormatter.string(from: endDate!)
        
        destinationLabel.text = "Destination: " + destinationText
        startDateLabel.text = "Start Date: " + startDate1
        endDateLabel.text = "End Date: " + endDate1
        imageView.image = UIImage(named: picName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //intializeTrips()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
