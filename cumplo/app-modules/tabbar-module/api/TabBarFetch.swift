//
//  TabBarAPIRest.swift
//  TabBar
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Alamofire
import ObjectMapper

class TabBarFetch: TabBarProtocolFetchInput {

    //MARK: - Functions
    //MARK: CRUD
    func getTabs(response: @escaping ([UIViewController]?, NSError?) -> (Void)) {

        let opportunity = OpportunityRouter.build()
        opportunity.tabBarItem = UITabBarItem(
            title: "Oportunidades",
            image: UIImage().opportunityIcon,
            tag: 1
        )
        let setting = SettingRouter.build()
        setting.tabBarItem = UITabBarItem(
            title: "Cuenta",
            image: UIImage().userCircleIcon,
            tag: 4
        )
        response([opportunity, setting], nil)
    }
}
