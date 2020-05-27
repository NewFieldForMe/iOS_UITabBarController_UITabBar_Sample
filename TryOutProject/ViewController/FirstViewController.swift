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

    override func loadView() {
        view = UIView()
        view.backgroundColor = .blue

        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerLabel)
        NSLayoutConstraint.activate([
            centerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
