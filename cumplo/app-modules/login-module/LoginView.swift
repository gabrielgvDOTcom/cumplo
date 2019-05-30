//
//  LoginView.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class LoginView: BaseController {

    //MARK: - VARs
    var presenter: LoginProtocolPresenter?

    //MARK: - IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var linkedinButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var passwordButton: UIButton!
    
    //MARK: - Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        scrollView.contentInsetAdjustmentBehavior = .never
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.viewWillDisappear()
    }

    //MARK: - Action´s Buttons
    @IBAction func passwordTapped(_ sender: Any) {
        print("hola")
    }
    @IBAction func registerTapped(_ sender: Any) {
        presenter?.pushToRegisterView()
    }
    @IBAction func loginTapped(_ sender: Any) {
        presenter?.login(email: emailTextField.text!, password: passwordTextField.text!)
    }
    @IBAction func hideKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func linkedinTapped(_ sender: Any) {}
    @IBAction func googleTapped(_ sender: Any) {}
    @IBAction func facebookTapped(_ sender: Any) {}
    @IBAction func twitterTapped(_ sender: Any) {}

    //MARK: - Functions
    //MARK: System
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension LoginView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case emailTextField.tag: return passwordTextField.becomeFirstResponder()
        case passwordTextField.tag: return passwordTextField.resignFirstResponder()
        default: return true
        }
    }
}
extension LoginView: LoginProtocolView {
    
    func resume() {
        loader.dismiss()
    }
    func load(message: String?) {
        loader.message = message
        loader.present()
    }

    func style() {
        titleLabel.style(Style.Table.Header.Title)
        subtitleLabel.style(Style.Login.SubTitle)
        loginButton.style(Style.UI.Button.Primary)
        registerButton.style(Style.UI.Button.Secondary)
        passwordButton.style(Style.Login.PasswordButton)
    }
    func endediting() {
        self.view.endEditing(true)
    }
    func keyboard(inset: UIEdgeInsets) {
        print(inset)
        self.scrollView.contentInset = inset
    }
    func navigation(show status: Bool) {
        self.navigationController?.isNavigationBarHidden = !status
    }
}
