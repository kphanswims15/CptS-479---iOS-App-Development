//
//  ViewController.swift
//  phanKimi_TravelerSettings
//
//  Created by Kimberlee Phan on 2/20/18.
//  Copyright © 2018 Kimberlee Phan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var sortByLabel: UILabel!
    @IBOutlet weak var showImageLabel: UILabel!
    
    
    let userDefaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let showImage = userDefaults.bool(forKey: "showImage")
        
        if showImage == true {
            showImageLabel.text = "Show Image: On"
        } else {
            showImageLabel.text = "Show Image: Off"
        }
        
        let sortBy = userDefaults.integer(forKey: "sortBy")
        
        if sortBy == 0 {
            sortByLabel.text = "Sort By: Destination"
        } else {
            sortByLabel.text = "Sort By: Start Date"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let settings = NotificationCenter.default
        settings.addObserver(self, selector: #selector(ViewController.updateSettings), name: UserDefaults.didChangeNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateSettings (_ notification: NSNotification) {
        if let name = userDefaults.string(forKey: "name_preference") {
            nameLabel.text = "Name: " + name
        }
        
        let distances = userDefaults.string(forKey: "distances")
        
        distanceLabel.text = "Distances: " + distances!
    }

    @IBAction func changeDeviceSettingsPressed(_ sender: UIButton) {
        if let settingsURL = URL(string: UIApplicationOpenSettingsURLString) {
            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
        }
    }
}

