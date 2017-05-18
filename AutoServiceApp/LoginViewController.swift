//
//  LoginViewController.swift
//  AutoServiceApp
//
//  Created by Alex Danner on 4/4/17.
//  Copyright © 2017 Alex Danner. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        PFUser.logInWithUsername(inBackground: email!, password: password!, block: {(user, error) in
            if user != nil {
                //Yes user exists
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let firstViewController = storyboard.instantiateViewController(withIdentifier: "firstViewController")
//                self.present(firstViewController, animated: true, completion: nil)
                
                self.dismiss(animated: true, completion: nil)
            }
            else {
                
                //No user doesn't exist
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                //let alertView = UIAlertView(title: "Error", message: "Invalid Username or Password", delegate: self, cancelButtonTitle: "OK")
                //alertView.show();
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                
            }
        })
    }
    
    @IBAction func forgotPasswordButton(_ sender: UIButton) {
    }

}
