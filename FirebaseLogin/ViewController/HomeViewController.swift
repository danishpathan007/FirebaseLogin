//
//  HomeViewController.swift
//  CustomLoginDemo
//
//  Created by Christopher Ching on 2019-07-22.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class HomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
   // var ref: DatabaseReference!

    var ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserInfo()
        
    }
    

    private func getUserInfo() {
        let user = Auth.auth().currentUser
        if let user = user {
          // The user's ID, unique to the Firebase project.
          // Do NOT use this value to authenticate with your backend server,
          // if you have one. Use getTokenWithCompletion:completion: instead.
          let uid = user.uid
          let email = user.email
          let photoURL = user.photoURL
          var multiFactorString = "MultiFactor: "
          for info in user.multiFactor.enrolledFactors {
            multiFactorString += info.displayName ?? "[DispayName]"
            multiFactorString += " "
          }
            welcomeLabel.text = "Welcome \(email ?? "")"
        }
        
        
    }
    
}
