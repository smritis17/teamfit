//
//  workoutViewController.swift
//  teamFit
//
//  Created by Smriti Somasundaram on 12/5/22.
//

import UIKit
import FirebaseAuth

class workoutViewController: UIViewController {
   
    @IBOutlet weak var arm: buttonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //sign out and return to login page if log out button is pressed
    @IBAction func logout(_ sender: Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }

    
    
    
//linking arms, legs, cardio, and abs buttons to playlists
    @IBAction func linkArms(_ sender: Any) {
        if let url = URL(string: "https://www.youtube.com/watch?v=9-Le2gJoIvY&list=PL2ov72VWpiOqyazKk_xVAaw_01NDQILqq") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
    }
    
    @IBAction func linkLegs(_ sender: Any) {
        if let url = URL(string: "https://www.youtube.com/watch?v=_PRk8DH2_mY&list=PLvf_LH4Nzg11DaBLeesmCKfWkHWIYyuBp") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
    }
    
    @IBAction func linkCardio(_ sender: Any) {
        if let url = URL(string: "https://www.youtube.com/watch?v=ml6cT4AZdqI&list=PL7Ax6CP9_hgPM5IQBajGHgd2zLmMPc-GV") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
    }
    
    @IBAction func linkAbs(_ sender: Any) {
        if let url = URL(string: "https://www.youtube.com/watch?v=HvejrDLhNsI&list=PLtQmcQeXvpL_YBzkqfF38NEDY5mlrwVfD") {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
    }
}



