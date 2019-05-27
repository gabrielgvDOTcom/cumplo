//
//  InvestorsView.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class InvestorsView: BaseController {

    //MARK: - VARs
    var presenter: InvestorsProtocolPresenter?

    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "HeaderText", bundle: nil), forCellReuseIdentifier: "HeaderText")
            tableView.register(UINib(nibName: "ResumeBusiness", bundle: nil), forCellReuseIdentifier: "ResumeBusiness")
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
extension InvestorsView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ResumeBusiness", for: indexPath) as! ResumeBusiness
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "InvestorsCell", for: indexPath) as! InvestorsCell
        return cell
    }
}
extension InvestorsView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderText") as! HeaderText
        cell.titleLabel.isHidden = true
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 72 : 64
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
}
extension InvestorsView: InvestorsProtocolView {

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
