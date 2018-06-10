//
//  ViewController.swift
//  Traveler
//
//  Created by Kimberlee Phan on 1/15/18.
//  Copyright © 2018 Kimberlee Phan. All rights reserved.
//

import UIKit
import UserNotifications

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
    
    var alertNotificationsOkay = false
    
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
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(ViewController.settingsChanged), name: UserDefaults.didChangeNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = destinationText
        content.body = "It was a great trip!"
        content.userInfo["message"] = destinationText
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        let request = UNNotificationRequest(identifier: "NowPlusFive", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request)
    }
    
    @IBAction func scheduleNotificationPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Traveler", message: "Schedule notification?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(action) in self.scheduleNotification()}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func settingsChanged(_ notification: NSNotification)
    {
        
    }
    
    func checkNotifications ()
    {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings{(settings) in
            self.alertNotificationsOkay = false
            if settings.alertSetting == .enabled {
                self.alertNotificationsOkay = true
            }
        }
    }
}
