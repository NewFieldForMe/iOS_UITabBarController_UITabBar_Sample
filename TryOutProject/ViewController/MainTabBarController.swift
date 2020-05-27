//
//  MainTabBarController.swift
//  TryOutProject
//
//  Created by yamada.ryo on 2020/05/26.
//  Copyright © 2020 yamadaryo. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTab()
    }
}

private extension MainTabBarController {
    func setupTab() {
        let firstViewController = FirstViewController()
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        let secondViewController = SecondViewController()
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        viewControllers = [firstViewController, secondViewController]
    }
}
