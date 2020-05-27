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
        delegate = self  // delegateを設定
        let firstViewController = FirstViewController()
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        let secondViewController = SecondViewController()
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        viewControllers = [firstViewController, secondViewController]
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    // shouldSelectメソッドを実装
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController == tabBarController.viewControllers?[1] {
            present(ModalViewController(), animated: true, completion: nil)
            return false
        }
        return true
    }
}