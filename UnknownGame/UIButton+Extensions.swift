//
//  UIButton+Extensions.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 31.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    @objc private func animateDown(sender: UIButton) {
        shopTag = tag
        NotificationCenter.default.post(name: NSNotification.Name("AnimateShopViewsDown"), object: nil)
    }
    
    @objc private func animateUp(sender: UIButton) {
        shopTag = tag
        NotificationCenter.default.post(name: NSNotification.Name("AnimateShopViewsUp"), object: nil)
    }
    
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut],
                       animations: {
                        button.transform = transform
            }, completion: nil)
    }
    
}
