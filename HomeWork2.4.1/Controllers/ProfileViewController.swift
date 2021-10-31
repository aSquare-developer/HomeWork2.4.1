//
//  ProfileViewController.swift
//  HomeWork2.4.1
//
//  Created by Artur Anissimov on 30.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var firstnameLabel: UILabel!
    @IBOutlet var lastnameLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let user = user else { return }
        
        usernameLabel.text = user.username
        
        for userProfile in user.profile {
            firstnameLabel.text = userProfile.firstname
            lastnameLabel.text = userProfile.lastname
        }
        
        let profileDetails = UIBarButtonItem(title: "More >",
                                             style: .done ,
                                             target: self,
                                             action: #selector(profileDetailsFunc))
        
        self.navigationItem.rightBarButtonItem = profileDetails
        
    }
    

    @objc private func profileDetailsFunc() {
        print("Click")
    }


}
