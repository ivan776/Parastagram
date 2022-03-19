//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Ivan Mendoza on 2/12/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {


    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if(user != nil) {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            } else {
                print("Error: \(error?.localizedDescription)")
                
                let alertDisapperTimeInSeconds = 1.5
                let alert = UIAlertController(title: nil, message: "Sign In Error", preferredStyle: .actionSheet)
                self.present(alert, animated: true)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + alertDisapperTimeInSeconds) {
                  alert.dismiss(animated: true)
                }
                
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
               
            } else {
                print("Error: \(error?.localizedDescription)")
                let alertDisapperTimeInSeconds = 1.5
                let alert = UIAlertController(title: nil, message: "Sign Up Error!", preferredStyle: .actionSheet)
                self.present(alert, animated: true)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + alertDisapperTimeInSeconds) {
                  alert.dismiss(animated: true)
                }
            }
        }
        
    }

}
