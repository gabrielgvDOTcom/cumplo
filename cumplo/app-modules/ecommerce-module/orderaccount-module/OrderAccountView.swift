//
//  OrderAccountView.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import weeKGKit

class OrderAccountView: BaseController {

    var accountSelected: BankAccountEntity?
    var accounts: [BankAccountEntity]! = []
    
    //MARK: - VARs
    var presenter: OrderAccountProtocolPresenter?

    //MARK: - IBOutlet
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.separatorInset = UIEdgeInsets(top: 0, left: 55, bottom: 0, right: 0)
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
    @IBAction func doneTapped(_ sender: Any) {
        presenter?.orderStart(accountSelected: accountSelected)
    }

    //MARK: - Functions
    //MARK: System
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension OrderAccountView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderAccountCell", for: indexPath) as! OrderAccountCell
        cell.display(item: accounts[indexPath.row])
        return cell
    }
}
extension OrderAccountView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        accountSelected = accounts[indexPath.row]
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderText") as! HeaderText
        cell.titleLabel.text = "SELECCIONA CON QUE CUENTA QUIERES INVERTIR"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
}
extension OrderAccountView: OrderAccountProtocolView {

    //MARK: - Functions
    //MARK: Data
    func deliver(accounts data: [BankAccountEntity]) {
        accounts = data
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

        doneButton.style(Style.UI.Button.Primary)
    }
    func title(str: String) {
        self.title = str
    }
}
