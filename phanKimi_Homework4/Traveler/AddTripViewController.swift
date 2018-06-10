//
//  AddTripViewController.swift
//  Traveler
//
//  Created by Kimberlee Phan on 2/1/18.
//  Copyright © 2018 Kimberlee Phan. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {
    // outlets and vars
    @IBOutlet weak var numTripInfoLabel: UILabel!
    @IBOutlet weak var destinationField: UITextField!
    @IBOutlet weak var startDateField: UITextField!
    @IBOutlet weak var endDateField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    var numTrip: Int = 0
    var flag: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
        destinationField.delegate = self
        startDateField.delegate = self
        endDateField.delegate = self
        self.errorMessageLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // sets up the UI of add trip
    func setUI() {
        self.numTripInfoLabel.text = "Add New Trip #\(numTrip)"
    }
    
    // save button was pressed
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        // try to convert user input into date
        let startDate = dateFormatter.date(from: startDateField.text!)
        let endDate = dateFormatter.date(from: endDateField.text!)
        
        // checks if destination it is not empty
        if destinationField.text == "" {
            self.errorMessageLabel.text = "Missing destination"
        } else if startDate == nil { // checks if start date is valid
            self.errorMessageLabel.text = "Invalid start date"
        } else if endDate == nil { // checks if end date is valid
            self.errorMessageLabel.text = "Invalid end date"
        } else { // all fields are valid
            flag = 1
            self.performSegue(withIdentifier: "unwindToTripVC", sender: self)
        }
    }
    
    // cancel button was pressed
    @IBAction func cancelButton(_ sender: UIButton) {
        flag = 0
    }
}

extension AddTripViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
