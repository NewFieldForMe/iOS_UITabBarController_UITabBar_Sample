//
//  FirstViewController.swift
//  TryOutProject
//
//  Created by yamada.ryo on 2020/05/26.
//  Copyright © 2020 yamadaryo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    lazy var centerLabel: UILabel = {
        let label = UILabel()
        label.text = "First"
        label.font = UIFont.boldSystemFont(ofSize: 70.0)
        label.textColor = UIColor.white
        return label
    }()

    // 「2つ目のタブを選択」ボタンを追加
    lazy var selectSecondTabButton: UIButton = {
        let button = UIButton()
        button.setTitle("2つ目のタブを選択", for: .normal)
        return button
    }()

    override func loadView() {
        view = UIView()
        view.backgroundColor = .blue

        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerLabel)
        NSLayoutConstraint.activate([
            centerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // 「2つ目のタブを選択」ボタンを配置し、タップ時のイベントを設定
        selectSecondTabButton.translatesAutoresizingMaskIntoConstraints = false
        selectSecondTabButton.addTarget(self, action: #selector(tapSelectSecondTabButton), for: .touchUpInside)
        view.addSubview(selectSecondTabButton)
        NSLayoutConstraint.activate([
            selectSecondTabButton.topAnchor.constraint(equalTo: centerLabel.bottomAnchor),
            selectSecondTabButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

private extension FirstViewController {
    // 「2つ目のタブを選択」ボタンをタップしたら、2つ目のタブをアクティブにする
    @objc func tapSelectSecondTabButton(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 1
    }
}
