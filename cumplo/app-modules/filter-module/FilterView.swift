//
//  FilterView.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class FilterView: BaseController {

    var search: Bool = false
    var filters: [FilterEntity] = []
    var business: [BusinessEntity] = []
    var businessSelected: BusinessEntity!
    var searchController: UISearchController!
    
    //MARK: - VARs
    var presenter: FilterProtocolPresenter?

    //MARK: - IBOutlet
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "HeaderText", bundle: nil), forCellReuseIdentifier: "HeaderText")
            tableView.register(UINib(nibName: "FooterText", bundle: nil), forCellReuseIdentifier: "FooterText")
            tableView.register(UINib(nibName: "ResumeBusiness", bundle: nil), forCellReuseIdentifier: "ResumeBusiness")
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
    @IBAction func applyTapped(_ sender: Any) {
        
    }
    
    //MARK: - Functions
    //MARK: System
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension FilterView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if search { return 1 }
        return filters.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if search { return business.count }
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if search {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ResumeBusiness", for: indexPath) as! ResumeBusiness
            cell.display(item: business[indexPath.row])
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as! FilterCell
        return cell
    }
}
extension FilterView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if search {
            search = false
            businessSelected = business[indexPath.row]
            searchController.searchBar.resignFirstResponder()
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if search { return nil }
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderText") as! HeaderText
        cell.titleLabel.text = filters[section].header.title
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if search { return 72 }
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if search { return 0 }
        return filters[section].header.height ?? 55
    }
}
extension FilterView: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {}
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search = false
        applyButton.alpha = 1.0
        applyButton.isEnabled = true
        tableView.reloadData()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        search = true
        applyButton.alpha = 0.75
        applyButton.isEnabled = false
        searchController.searchBar.showsCancelButton = true
        presenter?.getBusiness()

        var cancelButton: UIButton
        let topView: UIView = self.searchController.searchBar.subviews.first!
        for subView in topView.subviews {
            if subView.isKind(of: NSClassFromString("UINavigationButton")!) {
                cancelButton = subView as! UIButton
                cancelButton.setTitle("Cancelar", for: UIControl.State())
                cancelButton.tintColor = UIColor.darkGray
                cancelButton.titleLabel?.font = UIFont(size: 14, weight: .medium)
            }
        }
    }
}
extension FilterView: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.length() >= 3 {
            tableView.reloadData()
        }
    }
}
extension FilterView: FilterProtocolView {

    //MARK: - Functions
    //MARK: Data
    func deliver(filters data: [FilterEntity]) {
        filters = data
        tableView.reloadData()
    }
    func deliver(business data: [BusinessEntity]) {
        business = data
        tableView.reloadData()
    }
    func deliver(leftButtons buttons: [UIBarButtonItem]) {
        self.navigationItem.leftBarButtonItems = buttons
    }
    func deliver(rightButtons buttons: [UIBarButtonItem]) {
        self.navigationItem.rightBarButtonItems = buttons
    }
    func deliver(searchControllerObject object: UISearchController) {
        searchController = object
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
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
        applyButton.style(Style.UI.Button.Primary)
    }
    func title(str: String) {
        self.title = str
    }
    func keyboard(inset: UIEdgeInsets) {
        tableView.contentInset = inset
    }
}
