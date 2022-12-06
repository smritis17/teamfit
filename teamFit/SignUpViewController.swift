//
//  signUp.swift
//  Fitness App
//
//  Created by Smriti Somasundaram on 12/1/22.
//
import UIKit
import FirebaseDatabase
import FirebaseAuth

class SignUpViewController: UIViewController {
    //creating references to all text fields and error labels
    @IBOutlet weak var success: UILabel!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var pass2: UITextField!
    @IBOutlet weak var empty: UILabel!
    @IBOutlet weak var match: UILabel!
    @IBOutlet weak var invalid: UILabel!
    override func viewDidLoad() {
        //making sure all error labels are false
        invalid.isHidden = true
        match.isHidden = true
        empty.isHidden = true
        success.isHidden = true
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: Any) {
        success.isHidden = true
        empty.isHidden = true
        match.isHidden = true
        invalid.isHidden = true
        //if any of the text fields are empty
        if (emailText.text?.isEmpty == true || firstName.text?.isEmpty == true || lastName.text?.isEmpty == true || pass.text?.isEmpty == true || pass2.text?.isEmpty == true) {
                empty.isHidden = false
            }
            if empty.isHidden == true {
                //is the email text field a valid email
                let email = isValidEmail(emailText.text!)
                if (email == false) {
                    invalid.isHidden = false
                }
                //do the passwords match
                if (pass.text != pass2.text) {
                    match.isHidden = false
                }
            }
            //creating a user as long as there's no error
                if empty.isHidden == true, match.isHidden == true, invalid.isHidden == true {
                           Auth.auth().createUser(withEmail: emailText.text!, password: pass.text!) { authResult, error in
                               guard let user = authResult?.user, error == nil else {
                                   print(error!.localizedDescription)
                                   return
                               }
                               //adding the sign up information into the database under the info section under their uid
                               let ref = Database.database().reference()
                               let uid = user.uid
                            let newUserReference = ref.child("Accounts").child(uid).child("info")
                               newUserReference.setValue(["firstName": self.firstName.text!, "lastName": self.lastName.text!, "email":self.emailText.text!, "password": self.pass.text!])
                           }
                    //going back to the login page once successful
                    success.isHidden = false
                    sleep(2)
                    self.dismiss(animated: false, completion: nil)
                   }
    }
    //how to check if an email is valid
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
