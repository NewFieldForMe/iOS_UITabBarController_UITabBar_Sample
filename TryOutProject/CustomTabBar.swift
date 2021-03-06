//
//  CustomTabBar.swift
//  TryOutProject
//
//  Created by yamada.ryo on 2020/06/01.
//  Copyright © 2020 yamadaryo. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBar {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 70
        sizeThatFits.height += safeAreaInsets.bottom

        return sizeThatFits
    }

    func barItemImage(index: Int) -> UIImageView? {
        let view = subviews[index + 1]
        return view.recursiveSubviews.compactMap { $0 as? UIImageView }
        .first
    }
}

extension UIView {
    var recursiveSubviews: [UIView] {
        return subviews + subviews.flatMap { $0.recursiveSubviews }
    }
}
