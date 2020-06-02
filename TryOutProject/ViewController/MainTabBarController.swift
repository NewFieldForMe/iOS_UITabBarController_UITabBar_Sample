//
//  MainTabBarController.swift
//  TryOutProject
//
//  Created by yamada.ryo on 2020/05/26.
//  Copyright © 2020 yamadaryo. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        object_setClass(tabBar, CustomTabBar.self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
        let thirdViewController = ThirdViewController()
        thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        viewControllers = [firstViewController, secondViewController, thirdViewController]
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    // shouldSelectメソッドを実装
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController == tabBarController.viewControllers?[0] {
            // badgeを消す
            viewController.tabBarItem.badgeValue = nil
        }
        if viewController == tabBarController.viewControllers?[1] {
            let modal = ModalViewController()
            modal.selectThirdTab = { [weak self] in
                self?.selectedIndex = 2
            }
            present(modal, animated: true, completion: nil)
            return false
        }
        return true
    }
}
