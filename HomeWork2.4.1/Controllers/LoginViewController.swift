//
//  WelcomeViewController.swift
//  HomeWork2.4.1
//
//  Created by Artur Anissimov on 30.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    let user = User.getUsers()
    
    // MARK: - IBOutlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    

    // MARK: - Ovveride Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            
            switch viewController {
            case is WelcomeViewController:
                guard let welcomeVC = viewController as? WelcomeViewController else { return }
                welcomeVC.user = user
            case is UINavigationController:
                guard let navigationVC = viewController as? UINavigationController else { return }
                guard let profileVC = navigationVC.topViewController as? ProfileViewController else { return }
                profileVC.user = user
            default:
                break
            }
            
        }
        
    }
    
    // MARK: - IBActions
    @IBAction func logInButtonAction() {
        if usernameTextField.text != user.username || passwordTextField.text != user.password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField
            )
        }
    }
    
    @IBAction func forgotUsernameAndPasswordButtonAction(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is User! 😉")
        : showAlert(title: "Oops!", message: "Your password is Password! 😉")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - @OBJC Private Func
    @objc private func keyboardWillShow(notification: NSNotification) {
        
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        self.view.frame.origin.y = 0 - keyboardSize.height / 2
    }
    
    @objc private func keyboardWillHide() {
        self.view.frame.origin.y = 0
    }
    
}
// MARK: - UIViewController extension
extension UIViewController {
    func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//MARK: - LoginViewController extension UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonAction()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
    
}
