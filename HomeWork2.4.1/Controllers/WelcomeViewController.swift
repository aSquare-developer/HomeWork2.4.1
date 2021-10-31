//
//  WelcomeViewController.swift
//  HomeWork2.4.1
//
//  Created by Artur Anissimov on 30.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    var username: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let username = username else { return }
        
        for userData in username.profile {
            label.text = "Welcome, \(userData.firstname)"
        }

    }
    
}
