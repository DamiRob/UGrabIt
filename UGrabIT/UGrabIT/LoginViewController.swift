//
//  ViewController.swift
//  FirebaseLogin
//
//  Created by Jabari on 5/9/18.
//  Copyright © 2018 Jabari. All rights reserved.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBAction func clickedBtn(_ sender: Any) {
        
        if segment.selectedSegmentIndex == 0 {
            login()
        } else if segment.selectedSegmentIndex == 1 {
            signup()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func login() {
        if self.email.text == "" || self.password.text == "" {
            
            print("Please Enter Email/Password")
        } else {
            Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!) { (user,error) in
                
                if error == nil {
                    
                    print("Welcome! You have successfully logged in")
                    
                } else {
                    print("Error. Please try again")
                }
                
            }
        }
    }
    func signup() {
        if email.text == "" {
            print("Error. Please try again")
        } else {
            Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
                
                if error == nil {
                    print("Congratulations! You have successfully signed up")
                } else {
                    print("Error. Please Try again")
                }
                
            }
        }
    }
    
    
}



