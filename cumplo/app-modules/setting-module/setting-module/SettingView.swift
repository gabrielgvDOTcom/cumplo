//
//  SettingView.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class SettingView: BaseController {

    var modules: [PageEntity] = []
    
    //MARK: - VARs
    var presenter: SettingProtocolPresenter?

    //MARK: - IBOutlet

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
extension SettingView: FGPageDelegate {
    
    func numberOfSections(in pageView: FGPageView) -> Int {
        return modules.count
    }
    func pageView(_ pageView: FGPageView, didChangePage page: Int) {
        
    }
    func pageView(_ pageView: FGPageView, titleForPageIndex index: Int) -> String {
        return modules[index].title
    }
    func pageView(_ pageView: FGPageView, viewForPageIndex index: Int) -> UIViewController? {
        return modules[index].controller
    }
}
extension SettingView: SettingProtocolView {

    //MARK: - Functions
    //MARK: Data
    func deliver(pageView page: FGPage) {
        var page = page
        page.delegate = self
        page.present(container: self.view)
    }
    func deliver(modules data: [PageEntity]) {
        modules = data
    }
    
    //MARK: Random
    func resume() {
        loader.dismiss()
    }
    func load(message: String?) {
        loader.message = message
        loader.present(container: self)
    }

    func style() {}
    func title(str: String) {
        self.title = str
    }
}
