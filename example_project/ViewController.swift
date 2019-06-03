//
//  ViewController.swift
//  example_project
//
//  Created by Eric Liang on 5/23/19.
//  Copyright © 2019 theEWL. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    //Hello this is Farid
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = userName.text!
        let password = passWord.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
            
        }
    }

    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = userName.text
        user.password = passWord.text
        
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
            
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

