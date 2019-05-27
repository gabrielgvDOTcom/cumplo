//
//  EcommerceView.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class EcommerceView: BaseController {

    //MARK: - VARs
    var presenter: EcommerceProtocolPresenter?
    
    //MARK: - IBOutlet
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "HeaderText", bundle: nil), forCellReuseIdentifier: "HeaderText")
            tableView.register(UINib(nibName: "FooterText", bundle: nil), forCellReuseIdentifier: "FooterText")
            tableView.register(UINib(nibName: "ResumeBusiness", bundle: nil), forCellReuseIdentifier: "ResumeBusiness")
            tableView.register(UINib(nibName: "PointEcommerce", bundle: nil), forCellReuseIdentifier: "PointEcommerce")
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
    @IBAction func buyTapped(_ sender: Any) {
        presenter?.pushPreOrder()
    }

    //MARK: - Functions
    //MARK: System
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension EcommerceView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 3 : 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ResumeBusiness", for: indexPath) as! ResumeBusiness
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PointEcommerce", for: indexPath) as! PointEcommerce
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if indexPath.section == 0 {
            let delete = UITableViewRowAction(style: .destructive, title: "Eliminar") { (action, indexPath) in
                let alert = UIAlertController(title: "Eliminar", message: "¿Desea realmente Eliminar?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "Eliminar", style: .destructive, handler: { (action) in
                    
                }))
                self.present(alert, animated: true, completion: nil)
                
                tableView.isEditing = false
            }
            let edit = UITableViewRowAction(style: .normal, title: "Editar") { (action, indexPath) in
                tableView.isEditing = false

                self.presenter?.presentEditView(id: 0)
            }
            return [delete, edit]
        }

        return []
    }
}
extension EcommerceView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderText") as! HeaderText
        cell.titleLabel.text = "RESUMEN"
        cell.titleLabel.isHidden = section == 0
        return cell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return tableView.dequeueReusableCell(withIdentifier: "FooterText") as! FooterText
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 72 : 44
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 20 : 55
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}
extension EcommerceView: EcommerceProtocolView {

    //MARK: - Functions
    //MARK: Data

    //MARK: Random
    func resume() {
        loader.dismiss()
    }
    func load(message: String?) {
        loader.message = message
        loader.present()
    }

    func style() {

        buyButton.style(Style.UI.Button.Primary)
    }
    func title(str: String) {
        self.title = str
    }
    func message(viewWithTitle title: String, andMessage message: String) {
        
    }
}
