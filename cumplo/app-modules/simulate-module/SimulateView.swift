//
//  SimulateView.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class SimulateView: BaseController {

    //MARK: - VARs
    var presenter: SimulateProtocolPresenter?

    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "HeaderText", bundle: nil), forCellReuseIdentifier: "HeaderText")
            tableView.register(UINib(nibName: "FooterText", bundle: nil), forCellReuseIdentifier: "FooterText")
            tableView.register(UINib(nibName: "InversionDetailCell", bundle: nil), forCellReuseIdentifier: "InversionDetailCell")
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

    //MARK: - Functions
    //MARK: System
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension SimulateView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InversionDetailCell", for: indexPath) as! InversionDetailCell
        return cell
    }
}
extension SimulateView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderText") as! HeaderText
        cell.titleLabel.isHidden = true
        return cell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FooterText") as! FooterText
        cell.titleLabel.text = "El desarrollo definitivo del crédito dependerá del día de firma de pagaré y estará disponible para los inversionistas en el detalle de cada una de sus inversiones. \n\n* Los intereses de este crédito comenzarán a generarse el día en que se financie."
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 285
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
}
extension SimulateView: SimulateProtocolView {

    //MARK: - Functions
    //MARK: Data
    func deliver(array data: NSArray) {
        
    }
    
    //MARK: Random
    func resume() {
        loader.dismiss()
    }
    func load(message: String?) {
        loader.message = message
        loader.present()
    }

    func style() {}
    func title(str: String) {
        self.title = str
    }
}
