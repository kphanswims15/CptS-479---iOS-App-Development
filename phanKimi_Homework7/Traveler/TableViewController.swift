//
//  TableViewController.swift
//  Traveler
//
//  Created by Kimberlee Phan on 2/10/18.
//  Copyright © 2018 Kimberlee Phan. All rights reserved.
//

import UIKit
import UserNotifications

class TableViewController: UITableViewController {
    // variables and outlets
    var trips: [Trip] = []
    var myIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

        intializeTrips()
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
        
        addTrip(destination: "Fountain Valley", startDate: startDate2!, endDate: endDate2!, fileName: "plane.jpg")
    }
    
    // a function that adds the trip to the trips array
    func addTrip(destination : String, startDate : Date, endDate : Date, fileName : String){
        let trip = Trip(destinationName : destination, startDate : startDate, endDate : endDate)
        trip.imageFileName = fileName
        self.trips.append(trip)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return trips.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let destinationName = trips[indexPath.row].destinationName
        let startDate = dateFormatter.string(from: trips[indexPath.row].startDate)
        let endDate = dateFormatter.string(from: trips[indexPath.row].endDate)
        let imgage = trips[indexPath.row].imageFileName
    
        cell.textLabel?.text = destinationName
        cell.detailTextLabel?.text = startDate + "-" + endDate
        cell.imageView?.image = UIImage(named: imgage!)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let indexPath = tableView.indexPathForSelectedRow
            let destVC = segue.destination as! ViewController
            destVC.destinationText = trips[(indexPath?.row)!].destinationName
            destVC.startDate = trips[(indexPath?.row)!].startDate
            destVC.endDate = trips[(indexPath?.row)!].endDate
            destVC.picName = trips[(indexPath?.row)!].imageFileName!
        }
        
        if segue.identifier == "toDetail2" {
            let destVC = segue.destination as! ViewController
            destVC.destinationText = trips[myIndex].destinationName
            destVC.startDate = trips[myIndex].startDate
            destVC.endDate = trips[myIndex].endDate
            destVC.picName = trips[myIndex].imageFileName!
        }
    }
    
    @IBAction func unwindSegue (_ sender: UIStoryboardSegue){
        let destVC = sender.source as? AddTripViewController
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let startDate = dateFormatter.date(from: (destVC?.startDateField.text)!)
        let endDate = dateFormatter.date(from: (destVC?.endDateField.text)!)
        
        if destVC?.flag == 1 {
            addTrip(destination: (destVC?.destinationField.text)!, startDate: startDate!, endDate: endDate!, fileName: "plane.jpg")
        }
    }
 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            trips.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func handleNotification(_ response: UNNotificationResponse) {
        let tabVC = navigationController?.topViewController as? TableViewController
        if (tabVC != nil) {
            self.navigationController!.popViewController(animated: false)
        }
        
        let destName = response.notification.request.content.title
        
        for name in trips {
            if name.destinationName == destName {
                if tabVC != nil
                {
                    performSegue(withIdentifier: "toDetail2", sender: nil)
                }
            }
            myIndex = myIndex + 1
        }
    }
}
