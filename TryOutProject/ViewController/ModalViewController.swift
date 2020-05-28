//
//  ModalViewController.swift
//  TryOutProject
//
//  Created by yamada.ryo on 2020/05/27.
//  Copyright © 2020 yamadaryo. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    lazy var centerLabel: UILabel = {
        let label = UILabel()
        label.text = "Modal"
        label.font = UIFont.boldSystemFont(ofSize: 70.0)
        label.textColor = UIColor.white
        return label
    }()

    // 「3つ目のタブを選択」ボタンを追加
    lazy var selectThirdTabButton: UIButton = {
        let button = UIButton()
        button.setTitle("3つ目のタブを選択", for: .normal)
        return button
    }()

    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("閉じる", for: .normal)
        return button
    }()

    var selectThirdTab: (() -> Void)?

    override func loadView() {
        view = UIView()
        view.backgroundColor = .darkGray

        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerLabel)
        NSLayoutConstraint.activate([
            centerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // 「3つ目のタブを選択」ボタンを配置し、タップ時のイベントを設定
        selectThirdTabButton.translatesAutoresizingMaskIntoConstraints = false
        selectThirdTabButton.addTarget(self, action: #selector(tapSelectThirdTabButton), for: .touchUpInside)
        view.addSubview(selectThirdTabButton)
        NSLayoutConstraint.activate([
            selectThirdTabButton.topAnchor.constraint(equalTo: centerLabel.bottomAnchor),
            selectThirdTabButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // 「閉じる」ボタンを配置し、タップ時のイベントを設定
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: selectThirdTabButton.bottomAnchor),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

private extension ModalViewController {
    // 「3つ目のタブを選択」ボタンをタップしたら、3つ目のタブをアクティブにする
    @objc func tapSelectThirdTabButton(_ sender: UIButton) {
        selectThirdTab?()
    }

    @objc func tapCloseButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
