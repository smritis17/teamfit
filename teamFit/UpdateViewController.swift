//
//  UpdateViewController.swift
//  teamFit
//
//  Created by Smriti Somasundaram on 12/5/22.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class UpdateViewController: UIViewController {
    //creating connections to UI Labels on storyboard
    @IBOutlet weak var hourText: UILabel!
    @IBOutlet weak var waterText: UILabel!
    @IBOutlet weak var calCounter: UITextField!
    @IBOutlet weak var success: UILabel!
    //initializing base values for each category
    var newHour = "0"
    var newWater = "0"
    var newCal = "0"
    override func viewDidLoad() {
        //making sure the calorie counter only has a number pad
        calCounter.keyboardType = .numberPad
        //success label is hidden
        success.isHidden = true
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //signing out of firebase authentication and going back to login screen when log out button is pressed
    @IBAction func logout(_ sender: Any) {
           try! Auth.auth().signOut()
           self.dismiss(animated: false, completion: nil)
       }
    //updating label of hour to show the value of the stepper
    @IBAction func hourUpdate(_ sender: UIStepper) {
        hourText.text = String(sender.value)
    }
    //updating label of water to show the value of the stepper
    @IBAction func waterUpdate(_ sender: UIStepper) {
        waterText.text = String(sender.value)
        
    }
    //when the update button is pressed, update values into firebase
    @IBAction func updateValues(_ sender: Any) {
        success.isHidden = true
        
        //setting text value to initialized variables
        newHour = hourText.text ?? "0"
        newWater = waterText.text ?? "0"
        newCal = calCounter.text ?? "0"
        
        //finding today's date for child pathway
        let date = Date()
        let today = date.dateInput()
        let user = Auth.auth().currentUser
        let uid = user!.uid
        let ref = Database.database().reference().child("Accounts/\(uid)/\(today)")
        ref.observeSingleEvent(of: .value) { (snapshot) in
            let dict = snapshot.value as? [String: String]
            //querying for current values for today's date "pre-update"
            let water = dict?["waterCups"]
            let calories = dict?["calories"]
            let workoutHours = dict?["hours"]
            //adding values for each category through addVal function - must use addVal function when working with string values rather than floats and ints
            let watertotal = self.addVal(old: water ?? "", new: self.newWater)
            let caltotal = self.addVal(old: calories ?? "", new: self.newCal)
            let hourtotal = self.addVal(old: workoutHours ?? "", new: self.newHour)
            
            //replacing values at this position in database with the new totals
            ref.child("waterCups").setValue(watertotal)
            ref.child("calories").setValue(caltotal)
            ref.child("hours").setValue(hourtotal)
            //share success label once finished
            self.success.isHidden = false
                }
        }
    //method for adding two strings as floats and converting back to string
    func addVal(old:String, new: String) -> String {
        let number1 = Float(old) ?? 0
        let number2 = Float(new) ?? 0
        let total = number1+number2
        let newString = String(total)
        //print(newString)
        //print(type(of: newString))
        return newString
    }
}
    

