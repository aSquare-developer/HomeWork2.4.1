//
//  ProfileViewController.swift
//  HomeWork2.4.1
//
//  Created by Artur Anissimov on 30.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var firstnameLabel: UILabel!
    @IBOutlet var lastnameLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    
    var user: User?
    
    // MARK: - Ovveride Func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let user = user else { return }
        
        usernameLabel.text = user.username
        
        for userProfile in user.profile {
            firstnameLabel.text = userProfile.firstname
            lastnameLabel.text = userProfile.lastname
        }
    }
    
    // Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let profileDetailsVC = segue.destination as? ProfileDetailViewController else { return }
        profileDetailsVC.user = user
    }
}
