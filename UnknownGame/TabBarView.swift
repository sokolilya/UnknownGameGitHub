//
//  TabBarView.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 24.12.2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import UIKit

class TabBarView: UIView {

    @IBOutlet var tabBarImageViewCollection: [UIImageView]!
    @IBOutlet var buttonsOutletCollection: [UIButton]!
    @IBOutlet var tabBarViewCollection: [UIView]!
    
    @IBAction func tabBarButtonPressed(_ sender: UIButton) {
        currentVC = destinationVC
        destinationVC = sender.tag
        NotificationCenter.default.post(name: NSNotification.Name("presentVC"), object: nil)
        
    }
    @IBAction func animateDown(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("AnimateTabBar_Down"), object: nil)
    }
    @IBAction func animateUp(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("AnimateTabBar_Up"), object: nil)
    }
    
}
