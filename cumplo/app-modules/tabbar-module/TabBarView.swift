//
//  TabBarView.swift
//  TabBar
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class TabBarView: UITabBarController {

    var plusBarButton = UIButton().plusButton
    var ecommerceBarButton = UIButton().ecommerceButton

    //MARK: - VARs
    var presenter: TabBarProtocolPresenter?

    //MARK: - IBOutlet
    @IBOutlet weak var ecommerceButton: UIBarButtonItem!

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
    //MARK: Random
    func uibarbuttons() {
        plusBarButton.addTarget(self, action: #selector(alert(sender:)), for: .touchUpInside)
        ecommerceBarButton.addTarget(self, action: #selector(ecommerce(sender:)), for: .touchUpInside)
        
        self.title = "Oportunidades"
        self.navigationItem.hidesBackButton = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Filtrar",
            style: .plain,
            target: self,
            action: #selector(filter(sender:))
        )
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: ecommerceBarButton)
    }

    //MARK: Target
    @objc func alert(sender: UIButton) {
        presenter?.pushAlertSetView()
    }
    @objc func filter(sender: UIBarButtonItem) {
        presenter?.presentFilterView()
    }
    @objc func ecommerce(sender: UIButton) {
        presenter?.pushEcommerceView()
    }

    //MARK: System
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension TabBarView {

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        var left: [UIBarButtonItem]! = []
        var right: [UIBarButtonItem]! = [
            UIBarButtonItem(customView: ecommerceBarButton)
        ]

        switch tabBar.selectedItem?.tag {
        case 1:
            self.title = "Oportunidades"
            self.navigationItem.hidesBackButton = false
            left.append(UIBarButtonItem(
                title: "Filtrar",
                style: .plain,
                target: self,
                action: #selector(filter(sender:))
            ))
        case 2:
            self.title = "Alertas"
            self.navigationItem.hidesBackButton = true
            right.append(UIBarButtonItem(customView: plusBarButton))
        case 3:
            self.title = "Inversiones"
            self.navigationItem.hidesBackButton = true
        case 4:
            self.title = ""
            self.navigationItem.hidesBackButton = true
        default: break
        }
        
        self.navigationItem.leftBarButtonItems = left
        self.navigationItem.rightBarButtonItems = right
    }
}
extension TabBarView: TabBarProtocolView {

    //MARK: - Functions
    //MARK: Data
    func deliver(tabs data: [UIViewController]) {
        self.setViewControllers(data, animated: false)
        self.tabBar.tintColor = UIColor(named: "green")!
        self.uibarbuttons()
    }
    func deliver(barLeft button: [UIBarButtonItem]) {
        self.navigationItem.leftBarButtonItems = button
    }
    func deliver(barRight button: [UIBarButtonItem]) {
        self.navigationItem.rightBarButtonItems = button
    }

    //MARK: Random
    func resume() {
        
    }
    func load(message: String?) {
        
    }

    func style() {
        
    }
    func title(str: String) {
        self.title = str
    }
    func message(viewWithTitle title: String, andMessage message: String) {
        
    }
}
