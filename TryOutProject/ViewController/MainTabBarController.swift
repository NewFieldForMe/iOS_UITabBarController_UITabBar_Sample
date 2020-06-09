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

        // ViewControllerの切り替えアニメーション
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
          return false
        }
        if fromView != toView {
          UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
        }
        return true
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = tabBar.items?.firstIndex(of: item),
            let customTabBar = tabBar as? CustomTabBar,
            let imageView = customTabBar.barItemImage(index: index) else {
                return
        }
        iconBounceAnimation(view: imageView)
    }

    func iconBounceAnimation(view: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            view.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                view.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }, completion: nil)
    }
}
