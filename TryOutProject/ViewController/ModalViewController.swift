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

    override func loadView() {
        view = UIView()
        view.backgroundColor = .darkGray

        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerLabel)
        NSLayoutConstraint.activate([
            centerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}
