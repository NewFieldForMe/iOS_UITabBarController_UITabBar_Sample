//
//  ThirdViewController.swift
//  TryOutProject
//
//  Created by yamada.ryo on 2020/05/27.
//  Copyright © 2020 yamadaryo. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    lazy var centerLabel: UILabel = {
        let label = UILabel()
        label.text = "Third"
        label.font = UIFont.boldSystemFont(ofSize: 70.0)
        label.textColor = UIColor.white
        return label
    }()

    // 「バッジを表示」ボタンを追加
    lazy var showBadgeButton: UIButton = {
        let button = UIButton()
        button.setTitle("バッジを表示", for: .normal)
        return button
    }()

    override func loadView() {
        view = UIView()
        view.backgroundColor = .orange

        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerLabel)
        NSLayoutConstraint.activate([
            centerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // 「バッジを表示」ボタンを配置し、タップ時のイベントを設定
        showBadgeButton.translatesAutoresizingMaskIntoConstraints = false
        showBadgeButton.addTarget(self, action: #selector(tapShowBadgeButton), for: .touchUpInside)
        view.addSubview(showBadgeButton)
        NSLayoutConstraint.activate([
            showBadgeButton.topAnchor.constraint(equalTo: centerLabel.bottomAnchor),
            showBadgeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

private extension ThirdViewController {
    // 「バッジを表示」ボタンをタップしたら、1つ目のタブにバッジを表示する
    @objc func tapShowBadgeButton(_ sender: UIButton) {
        let tabBarItem = tabBarController?.viewControllers?[0].tabBarItem
        tabBarItem?.badgeValue = "test"
        tabBarItem?.badgeColor = UIColor.purple
    }
}
