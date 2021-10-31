//
//  ProfileDetailViewController.swift
//  HomeWork2.4.1
//
//  Created by Artur Anissimov on 31.10.2021.
//

import UIKit

class ProfileDetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var userFirstnameLabel: UILabel!
    @IBOutlet var userLastnameLabel: UILabel!
    @IBOutlet var userTypeLabel: UILabel!
    @IBOutlet var userGenderLabel: UILabel!
    @IBOutlet var userDateLabel: UILabel!
    @IBOutlet var userAboutLabel: UILabel!
    
    var user: User?
    
    // MARK: - Ovveride Func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let user = user else { return }
        
        userTypeLabel.text = user.type.rawValue

        for user in user.profile {
            userFirstnameLabel.text = user.firstname
            userLastnameLabel.text = user.lastname
            userGenderLabel.text = user.gender.definition
            userDateLabel.text = user.date
            userAboutLabel.text = user.aboutUser
        }
        
        configureNavBar()
        
    }
    
    // MARK: - Private Func
    private func configureNavBar() {
        self.navigationController?.navigationBar.tintColor = .black
    }
    
}
