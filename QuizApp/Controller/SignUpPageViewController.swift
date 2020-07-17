//
//  SignUpPageViewController.swift
//  QuizApp
//
//  Created by Ian Fuelberth on 7/13/20.
//  Copyright © 2020 HousingInsecurity. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpPageViewController: UIViewController {

    @IBOutlet weak var nameResponse: UITextField! //email
    @IBOutlet weak var usernameResponse: UITextField!
    @IBOutlet weak var passwordResponse: UITextField!
    
    @IBAction func signUpButton(_ sender: UIButton) {
        
        if let email = nameResponse.text, let password = passwordResponse.text
        {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error
                {
                    print(e.localizedDescription)
                    
                }
                else
                {
                    //Navigate to chat view controller
                    self.performSegue(withIdentifier: "toCategoryPage", sender: self)
                }
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    print("Jillian is working on this page")
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
