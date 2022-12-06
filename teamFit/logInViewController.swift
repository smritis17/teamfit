//
//  ViewController.swift
//  Fitness App
//
//  Created by Smriti Somasundaram on 12/1/22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class logInViewController: UIViewController {
    //creating references to all the text fields in created in UI
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var errorText: UILabel!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        //making sure the error text is hidden when loading the page
        errorText.isHidden = true
        super.viewDidLoad()
    }
    
    @IBAction func logIn(_ sender: Any) {
        //checking firebase for the email text and the password text. If it's there, following the segue to the home page, else showing the error message
        errorText.isHidden = true
                        guard let emailText = username.text else {
                            return
                        }
                        guard let passwordText = password.text else { return }
                        Auth.auth().signIn(withEmail: emailText, password: passwordText) { user, error in
                            if error == nil && user != nil {
                                let uid = Auth.auth().currentUser?.uid
                                
                                self.performSegue(withIdentifier: "goMain", sender: self)
                            } else {
                                self.errorText.isHidden = false
                            }
                        }
    }
    

}


