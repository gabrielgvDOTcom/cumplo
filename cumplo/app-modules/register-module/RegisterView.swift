//
//  RegisterView.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class RegisterView: BaseController {

    var form: [RegisterEntity] = []
    
    //MARK: - VARs
    var presenter: RegisterProtocolPresenter?

    //MARK: - IBOutlet
    @IBOutlet weak var initButton: UIButton!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "HeaderText", bundle: nil), forCellReuseIdentifier: "HeaderText")
            tableView.register(UINib(nibName: "FooterText", bundle: nil), forCellReuseIdentifier: "FooterText")
        }
    }
    
    //MARK: - Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
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
    @IBAction func initTapped(_ sender: Any) {
        
    }

    //MARK: - Functions
    //MARK: System
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension RegisterView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
extension RegisterView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return form.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return form[section].fields.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegisterCell", for: indexPath) as! RegisterCell
        cell.display(item: form[indexPath.section].fields[indexPath.row])
        return cell
    }
}
extension RegisterView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderText") as! HeaderText
        cell.titleLabel.text = form[section].title
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return form[indexPath.section].height
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let _ = form[section].title {
            return 55
        }
        return 20
    }
}
extension RegisterView: RegisterProtocolView {

    //MARK: - Functions
    //MARK: Data
    func deliver(form data: [RegisterEntity]) {
        form = data
        tableView.reloadData()
    }

    //MARK: Random
    func resume() {
        loader.dismiss()
    }
    func load(message: String?) {
        loader.message = message
        loader.present()
    }

    func style() {
        initButton.style(Style.UI.Button.Primary)
    }
    func endediting() {
        self.view.endEditing(true)
    }
    func title(str: String) {
        self.title = str
    }
    func keyboard(inset: UIEdgeInsets) {
        tableView.contentInset = inset
    }
    func navigation(show status: Bool) {
        self.navigationController?.isNavigationBarHidden = !status
    }
    func message(viewWithTitle title: String, andMessage message: String) {
        
    }
}
