//
//  UIStackView+Extensions.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 09.01.2020.
//  Copyright © 2020 Ilya Sokolov. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    
func removeAllArrangedSubviews() {
    
    //let removedSubViews = arrangedSubviews.red
    
    let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
    self.removeArrangedSubview(subview)
    return allSubviews + [subview]
            }
    // Deactivate all constraints
            NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
    // Remove the views from self
            removedSubviews.forEach({ $0.removeFromSuperview() })
        }
}
