//
//  WelcomeViewController.swift
//  HomeWork2.4.1
//
//  Created by Artur Anissimov on 30.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var label: UILabel!
    
    var user: User?
    
    // MARK: - Ovveride Func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let username = user else { return }
        
        for userData in username.profile {
            label.text = "Welcome, \(userData.firstname)"
        }

        configureTabBar()
    }
    
    // MARK: - Private Func
    private func configureTabBar() {
        self.tabBarController?.tabBar.backgroundColor = .systemGreen
        self.tabBarController?.tabBar.tintColor = .black
    }
    
}
