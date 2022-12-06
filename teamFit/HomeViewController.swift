//
//  HomeViewController.swift
//  teamFit
//
//  Created by Smriti Somasundaram on 12/2/22.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class HomeViewController: UIViewController {
    //creating connections to UI Labels
    @IBOutlet weak var todayDate: UILabel!
    @IBOutlet weak var waterCups: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var cal: UILabel!
    
    override func viewDidLoad() {
        //finding today's date
        let date = Date()
        todayDate.text = date.dateName()
        let today = date.dateInput()
        //creating pathway of database reference
        let ref = Database.database().reference()
        let user = Auth.auth().currentUser
        let uid = user!.uid
        //using .observe to call back data from database
        ref.child("Accounts/\(uid)/\(today)").observe(.value) { [self] snapshot  in
            //if there's an actual value, set each section to the following names and eventually to the text showing on the screen
            if snapshot.exists() {
                let dict = snapshot.value as? [String: String]
                let water = dict?["waterCups"]
                let calories = dict?["calories"]
                let workoutHours = dict?["hours"]
                self.cal.text = calories ?? ""
                self.hours.text = workoutHours ?? ""
                self.waterCups.text = water ?? ""
                } else {
                    //if not, create the baseline values under that day
                    let newUserReference = ref.child("Accounts").child(uid).child(today)
                    newUserReference.setValue(["waterCups": "0", "calories": "0", "hours":"0"])
                }
        }
        super.viewDidLoad()
    }
    //signing out through firebase authentication if log out button is pressed
    @IBAction func log(_ sender: Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
}
//formatting the date for Home Screen Title
extension Date {
    func dateName() -> String {
            let df = DateFormatter()
            df.setLocalizedDateFormatFromTemplate("MMM dd, yyyy")
            return df.string(from: self)
    }
    //formatting the date to input as pathway in database
    func dateInput() -> String {
            let df = DateFormatter()
            df.setLocalizedDateFormatFromTemplate("MMM-dd-yyyy")
            return df.string(from: self)
    }
}

