//
//  TabBarController.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 06/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import UIKit
import SwipeableTabBarController

class TabBarController: SwipeableTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewControllers = viewControllers {
            selectedViewController = viewControllers[0]
        }
        viewControllers?.forEach({ (v) in
            v.tabBarController?.tabBar.isHidden = true

        })
                
        swipeAnimatedTransitioning?.animationType = SwipeAnimationType.sideBySide
        tapAnimatedTransitioning?.animationType = SwipeAnimationType.push
        
        isCyclingEnabled = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(presentVC), name: NSNotification.Name(rawValue: "presentVC"), object: nil)
    }
    
    @objc func presentVC() {
        self.selectedIndex = destinationVC
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}
