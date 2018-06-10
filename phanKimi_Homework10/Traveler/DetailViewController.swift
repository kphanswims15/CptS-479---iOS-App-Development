//
//  DetailViewController.swift
//  Traveler
//
//  Created by Larry Holder on 2/7/18.
//  Copyright © 2018 Washington State University. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var trip: Trip!
    let dateFormatter = DateFormatter()
    let defaultImage = UIImage(named: "default.jpg")

    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var tripImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Trip Detail"
        navigationItem.prompt = "Traveler"
        dateFormatter.dateFormat = "MM/dd/yyyy"
        destinationLabel.text = "Destination: \(trip.destinationName)"
        startDateLabel.text = "Start Date: \(dateFormatter.string(from: trip.startDate))"
        endDateLabel.text = "End Date: \(dateFormatter.string(from: trip.endDate))"
        if let imageFileName = trip.imageFileName {
            if let image = readImageFromFile(imageFileName) {
                tripImageView.image = image
            } else {
                tripImageView.image = defaultImage
            }
        } else {
            tripImageView.image = defaultImage
        }
    }

    func readImageFromFile(_ fileName: String) -> UIImage? {
        if let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = directoryURL.appendingPathComponent(fileName)
            return UIImage(contentsOfFile: fileURL.path)
        }
        return nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
