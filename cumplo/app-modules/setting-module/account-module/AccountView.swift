//
//  AccountView.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class AccountView: BaseController {

    var form: [AccountEntity] = []
    
    //MARK: - VARs
    var presenter: AccountProtocolPresenter?

    //MARK: - IBOutlet
    @IBOutlet weak var saveButton: UIButton!
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.viewWillDisappear()
    }

    //MARK: - Action´s Buttons
    @IBAction func saveTapped(_ sender: Any) {
        
    }

    //MARK: - Functions
    //MARK: System
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension AccountView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return form.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return form[section].fields.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
        cell.display(item: form[indexPath.section].fields[indexPath.row])
        return cell
    }
}
extension AccountView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderText") as! HeaderText
        cell.titleLabel.text = form[section].title?.uppercased()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
}
extension AccountView: AccountProtocolView {

    //MARK: - Functions
    //MARK: Data
    func deliver(accountSettings data: [AccountEntity]) {
        form = data
        tableView.reloadData()
    }

    //MARK: Random
    func resume() {
        loader.dismiss()
    }
    func load(message: String?) {
        loader.message = message
        loader.present(container: self)
    }

    func style() {

        saveButton.style(Style.UI.Button.Primary)
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
}
